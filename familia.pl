:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- dynamic es_documento_de/2.

% Iniciar el servidor
server(Port) :-
    cargar_relaciones,  % Cargar relaciones al iniciar el servidor
    http_server(http_dispatch, [port(Port)]).

:- http_handler(root(query), handle_query, [method(post)]).

% Manejar consultas HTTP
handle_query(Request) :-
    set_cors_headers(Request), % Configurar encabezados
    catch(
        (   http_read_json_dict(Request, QueryDict), % Leer el JSON de la solicitud
            get_dict(operacion, QueryDict, Operacion), % Determinar la operación
            get_dict(profesor, QueryDict, Profesor),
            get_dict(documento, QueryDict, Documento),
            (   Operacion == "crear"
            ->  guardar_relacion(Profesor, Documento, Respuesta) % Crear la relación
            ;   consultar_relacion(Profesor, Documento, Respuesta) % Consultar la relación
            ),
            reply_json_dict(_{respuesta: Respuesta}) % Responder con el resultado
        ),
        Error,
        reply_json_dict(_{status: "error", mensaje: Error}) % Manejar errores
    ).

% Encabezados HTTP configurados para CORS
set_cors_headers(_) :-
    format('Access-Control-Allow-Origin: *~n', []),
    format('Access-Control-Allow-Methods: POST~n', []),
    format('Access-Control-Allow-Headers: Content-Type~n', []).

% Consultar una relación
consultar_relacion(Profesor, Documento, Respuesta) :-
    atom_string(ProfAtom, Profesor), % Convertir el profesor a átomo
    atom_string(DocAtom, Documento), % Convertir el documento a átomo
    (   es_documento_de(DocAtom, ProfAtom)
    ->  Respuesta = "Existe"
    ;   Respuesta = "Noexiste"
    ).

% Crear una relación
guardar_relacion(Profesor, Documento, Respuesta) :-
    atom_string(ProfAtom, Profesor), % Convertir el profesor a átomo
    atom_string(DocAtom, Documento), % Convertir el documento a átomo
    (   es_documento_de(DocAtom, ProfAtom)
    ->  Respuesta = "La relación ya existe"
    ;   assertz(es_documento_de(DocAtom, ProfAtom)), % Agregar la relación dinámicamente
        guardar_relaciones(DocAtom, ProfAtom), % Guardar en el archivo
        Respuesta = "Relación guardada exitosamente"
    ).

% Guardar relaciones en el archivo relaciones.pl
guardar_relaciones(Documento, Profesor) :-
    open('relaciones.pl', append, Stream),
    format(Stream, 'es_documento_de(\'~w\', \'~w\').~n', [Documento, Profesor]),
    close(Stream).

% Leer relaciones existentes desde el archivo
cargar_relaciones :-
    (   exists_file('relaciones.pl')
    ->  catch(
            (   consult('relaciones.pl'),
                findall(es_documento_de(Doc, Prof), es_documento_de(Doc, Prof), Relaciones),
                format('Relaciones cargadas: ~w~n', [Relaciones])
            ),
            Error,
            format('Error al cargar relaciones.pl: ~w~n', [Error])
        )
    ;   format('El archivo relaciones.pl no existe. No se cargaron relaciones previas.~n')
    ).
