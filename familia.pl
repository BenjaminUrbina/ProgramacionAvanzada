:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- dynamic es_documento_de/2.

% Iniciar el servidor
server(Port) :-
    cargar_relaciones,  % Cargar relaciones del archivo al iniciar el servidor
    http_server(http_dispatch, [port(Port)]).

:- http_handler(root(query), handle_query, [method(post)]).

% Manejar consultas HTTP
handle_query(Request) :-
    set_cors_headers(Request),
    catch(
        (   http_read_json_dict(Request, QueryDict),
            get_dict(profesor, QueryDict, Profesor),
            get_dict(documento, QueryDict, Documento),
            respond_to_query(Profesor, Documento, Respuesta),
            reply_json_dict(_{respuesta: Respuesta})
        ),
        Error,
        reply_json_dict(_{status: "error", mensaje: Error})
    ).

% Encabezados CORS
set_cors_headers(_) :-
    format('Access-Control-Allow-Origin: *~n', []),
    format('Access-Control-Allow-Methods: GET, POST~n', []),
    format('Access-Control-Allow-Headers: Content-Type~n', []),
    format('Content-Type: application/json~n~n').

% Responder a la consulta
respond_to_query(Profesor, Documento, Respuesta) :-
    format(atom(Respuesta), "Profesor: ~w, Documento: ~w", [Profesor, Documento]),
    guardar_relacion(Profesor, Documento).

% Guardar relaciones dinámicas y en el archivo
guardar_relacion(Profesor, Documento) :-
    (   es_documento_de(Documento, Profesor)
    ->  format('Relación ya existe en la base de datos dinámica: ~w, ~w~n', [Documento, Profesor])
    ;   assertz(es_documento_de(Documento, Profesor)),
        guardar_relaciones(Documento, Profesor)
    ).

guardar_relaciones(Documento, Profesor) :-
    read_existing_relations(Relations),
    (   member(es_documento_de(Documento, Profesor), Relations)
    ->  format('Relación ya existe en el archivo: ~w, ~w~n', [Documento, Profesor])
    ;   open('relaciones.pl', append, Stream),
        format(Stream, 'es_documento_de(\'~w\', \'~w\').~n', [Documento, Profesor]),
        close(Stream),
        format('Relación añadida al archivo: ~w, ~w~n', [Documento, Profesor])
    ).

% Leer relaciones existentes desde el archivo
read_existing_relations(Relations) :-
    (   exists_file('relaciones.pl')
    ->  catch(
            (   open('relaciones.pl', read, Stream),
                read_relations(Stream, Relations),
                close(Stream)
            ),
            _Error,
            (   format('Error al leer relaciones.pl. Verifique su contenido.~n'),
                Relations = []
            )
        )
    ;   Relations = []
    ).

read_relations(Stream, Relations) :-
    findall(
        Relation,
        (   read(Stream, Relation),
            Relation \= end_of_file
        ),
        Relations
    ).

% Cargar relaciones al iniciar el servidor
cargar_relaciones :-
    (   exists_file('relaciones.pl')
    ->  catch(
            (   consult('relaciones.pl'),
                format('Relaciones cargadas desde relaciones.pl~n')
            ),
            Error,
            format('Error al cargar relaciones.pl: ~w~n', [Error])
        )
    ;   format('El archivo relaciones.pl no existe. No se cargaron relaciones previas.~n')
    ).