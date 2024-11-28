% Módulos requeridos
:- usemodule(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).

% Define el endpoint principal
:- http_handler(root(query), handle_query, []).

% Iniciar el servidor en un puerto específico
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Manejador de consultas
handle_query(Request) :-
    set_cors_headers(Request),
    http_parameters(Request, [pregunta(PreguntaString, [string])]),
    term_string(Pregunta, PreguntaString),
    respond_to_query(Pregunta, Respuesta),
    reply_json_dict({respuesta: Respuesta}).

% Configuración de CORS
set_cors_headers(_Request) :-
    format('Access-Control-Allow-Origin: *~n', []),
    format('Access-Control-Allow-Methods: GET, POST~n', []),
    format('Access-Control-Allow-Headers: Content-Type~n', []),
    format('Content-Type: application/json~n').

respond_to_query(Pregunta, Respuesta) :-
    (
        Pregunta = mujer(X), mujer(X) ->
        format(atom(Respuesta), "~w es una mujer.", [X])
        ;
        Pregunta = hombre(X), hombre(X) ->
        format(atom(Respuesta), "~w es un hombre.", [X])
        ;
        Pregunta = es_hijo_de(X, Y) ->
        (
            es_hijo_de(X, Y) ->
            format(atom(Respuesta), "~w es hijo de ~w.", [X, Y])
            ;
            format(atom(Respuesta), "~w no es hijo de ~w.", [X, Y])
        )
        ;
        Respuesta = "No entiendo la pregunta. Intenta con otra cosa."
    ).

% Definimos los hombres
hombre(juan).
hombre(pedro).
hombre(luis).

% Definimos las mujeres
mujer(maria).
mujer(ana).
mujer(sofia).

% Relación de parentesco
es_hijo_de(pedro, juan).
es_hijo_de(pedro, maria).
es_hijo_de(luis, juan).
es_hijo_de(luis, maria).
es_hijo_de(sofia, pedro).
es_hijo_de(sofia, ana).

% Reglas para saber quién es abuelo/a
es_abuelo_de(X, Z) :-
    hombre(X),
    es_hijo_de(Y, X),
    es_hijo_de(Z, Y).
