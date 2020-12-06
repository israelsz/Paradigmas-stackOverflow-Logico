/*

████████╗██████╗  █████╗     ███████╗████████╗ █████╗  ██████╗██╗  ██╗
╚══██╔══╝██╔══██╗██╔══██╗    ██╔════╝╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝
   ██║   ██║  ██║███████║    ███████╗   ██║   ███████║██║     █████╔╝ 
   ██║   ██║  ██║██╔══██║    ╚════██║   ██║   ██╔══██║██║     ██╔═██╗ 
   ██║   ██████╔╝██║  ██║    ███████║   ██║   ██║  ██║╚██████╗██║  ██╗
   ╚═╝   ╚═════╝ ╚═╝  ╚═╝    ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
                                                                      
 */

% El tda Stack es la base para este programa, por ende, es posible requiera predicados de los otros tda.
% Representación: [[preguntas] [respuestas] [usuarios] [nombreUsuarioActivo]]

%Constructores:

%Crea un stack sin datos
crearStackVacio([[], [], [], []]).

%Crea un nuevo stack con datos actualizados.
crearStack(TDApreguntas,TDArespuestas,TDAusuarios,UsuarioActivo,StackSalida):-
    StackSalida = [TDApreguntas,TDArespuestas,TDAusuarios,UsuarioActivo].

%Selectores:

stackGetQuestions([Preguntas,_,_,_], Preguntas).

stackGetAnswers([_,Respuestas,_,_], Respuestas).

stackGetUsers([_,_,Usuarios,_], Usuarios).

stackGetActiveUser([_,_,_,ActiveUser], ActiveUser).

/*
████████╗██████╗  █████╗     ██████╗ ██████╗ ███████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗ █████╗ 
╚══██╔══╝██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗██╔════╝██╔════╝ ██║   ██║████╗  ██║╚══██╔══╝██╔══██╗
   ██║   ██║  ██║███████║    ██████╔╝██████╔╝█████╗  ██║  ███╗██║   ██║██╔██╗ ██║   ██║   ███████║
   ██║   ██║  ██║██╔══██║    ██╔═══╝ ██╔══██╗██╔══╝  ██║   ██║██║   ██║██║╚██╗██║   ██║   ██╔══██║
   ██║   ██████╔╝██║  ██║    ██║     ██║  ██║███████╗╚██████╔╝╚██████╔╝██║ ╚████║   ██║   ██║  ██║
   ╚═╝   ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝
*/    

%Representación

%(string X entero X string x date x labels x string x entero x entero)
% [pregunta, idPregunta, autor, [fecha], [etiquetas], estadoPregunta, recompensaOfrecida, votosTotales]

% Constructor:
crearPregunta(Pregunta,Id,Autor,Fecha,Etiquetas,EstadoPregunta, VotosTotales,SalidaPregunta):-
    SalidaPregunta = [Pregunta, Id, Autor, Fecha, Etiquetas, EstadoPregunta, VotosTotales].

% Selectores:

questionGetPregunta([Question,_,_,_,_,_,_], Question).

questionGetId([_,Id,_,_,_,_,_], Id).

questionGetUser([_,_,User,_,_,_,_], User).

questionGetDate([_,_,_,Date,_,_,_], Date).

questionGetLabels([_,_,_,_,Labels,_,_], Labels).

questionGetStatus([_,_,_,_,_,Status,_], Status).

questionGetVotes([_,_,_,_,_,_,Votes], Votes).

%Modificadores

%Cierra una pregunta, cambiando su Status a cerrada.
closeQuestion(TDApregunta,PreguntaModificada):-
    questionGetPregunta(TDApregunta,Pregunta),
    questionGetId(TDApregunta,Id),
    questionGetUser(TDApregunta,User),
    questionGetDate(TDApregunta,Date),
    questionGetLabels(TDApregunta,Labels),
    questionGetVotes(TDApregunta,Votes),
    PreguntaModificada= [Pregunta,Id,User,Date,Labels,"cerrada",Votes].

%Agrega un voto a un TDA pregunta
questionAddPositiveVote(TDApregunta,PreguntaModificada):-
    questionGetPregunta(TDApregunta,Pregunta),
    questionGetId(TDApregunta,Id),
    questionGetUser(TDApregunta,User),
    questionGetDate(TDApregunta,Date),
    questionGetLabels(TDApregunta,Labels),
    questionGetStatus(TDApregunta,Status),
    questionGetVotes(TDApregunta,Votes),
    NuevosVotos is Votes+1,
    PreguntaModificada = [Pregunta,Id,User,Date,Labels,Status,NuevosVotos].

%Resta un voto a un TDA pregunta
questionAddNegativeVote(TDApregunta,PreguntaModificada):-
    questionGetPregunta(TDApregunta,Pregunta),
    questionGetId(TDApregunta,Id),
    questionGetUser(TDApregunta,User),
    questionGetDate(TDApregunta,Date),
    questionGetLabels(TDApregunta,Labels),
    questionGetStatus(TDApregunta,Status),
    questionGetVotes(TDApregunta,Votes),
    NuevosVotos is Votes-1,
    PreguntaModificada = [Pregunta,Id,User,Date,Labels,Status,NuevosVotos].

%Pertenencia
%Permite conocer si la lista de entrada es o no una respuesta
isQuestion(TDApregunta):-
    length(TDApregunta, 7).
    

/*
████████╗██████╗  █████╗     ██████╗ ███████╗███████╗██████╗ ██╗   ██╗███████╗███████╗████████╗ █████╗ 
╚══██╔══╝██╔══██╗██╔══██╗    ██╔══██╗██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔════╝╚══██╔══╝██╔══██╗
   ██║   ██║  ██║███████║    ██████╔╝█████╗  ███████╗██████╔╝██║   ██║█████╗  ███████╗   ██║   ███████║
   ██║   ██║  ██║██╔══██║    ██╔══██╗██╔══╝  ╚════██║██╔═══╝ ██║   ██║██╔══╝  ╚════██║   ██║   ██╔══██║
   ██║   ██████╔╝██║  ██║    ██║  ██║███████╗███████║██║     ╚██████╔╝███████╗███████║   ██║   ██║  ██║
   ╚═╝   ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝      ╚═════╝ ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝
*/                                                                                                       

%Representación

% (string X entero X entero X string X date X labels X string X entero)
% [respuesta, idPreguntaQueResponde, idRespuesta, autor, [fecha], [etiquetas], estadoRespuesta, votosTotales]

% Constructor

crearRespuesta(Respuesta,IdPreguntaQueResponde,IdRespuesta,Autor,Fecha,Etiquetas,EstadoRespuesta,VotosTotales,SalidaRespuesta):-
    SalidaRespuesta = [Respuesta,IdPreguntaQueResponde,IdRespuesta,Autor,Fecha,Etiquetas,EstadoRespuesta,VotosTotales].

% Selectores

answerGetRespuesta([Respuesta,_,_,_,_,_,_,_], Respuesta).

answerGetIdPregunta([_,IdPreguntaQueResponde,_,_,_,_,_,_], IdPreguntaQueResponde).

answerGetId([_,_,IdRespuesta,_,_,_,_,_], IdRespuesta).

answerGetUser([_,_,_,Autor,_,_,_,_], Autor).

answerGetDate([_,_,_,_,Fecha,_,_,_], Fecha).

answerGetLabels([_,_,_,_,_,Etiquetas,_,_], Etiquetas).

answerGetStatus([_,_,_,_,_,_,EstadoRespuesta,_], EstadoRespuesta).

answerGetVotes([_,_,_,_,_,_,_,VotosTotales], VotosTotales).

%Modificadores

%Cambia el estado de una respuesta a aceptada
aceptarRespuesta(TDArespuesta,RespuestaModificada):-
    answerGetRespuesta(TDArespuesta,Respuesta),
    answerGetIdPregunta(TDArespuesta,IdPregunta),
    answerGetId(TDArespuesta,IdRespuesta),
    answerGetUser(TDArespuesta,Username),
    answerGetDate(TDArespuesta,Date),
    answerGetLabels(TDArespuesta,Labels),
    answerGetVotes(TDArespuesta,Votes),
    RespuestaModificada = [Respuesta,IdPregunta,IdRespuesta,Username,Date,Labels,"aceptada",Votes].

%Agrega un voto positivo a un TDA Respuesta
answerAddPositiveVote(TDArespuesta,RespuestaModificada):-
    answerGetRespuesta(TDArespuesta,Respuesta),
    answerGetIdPregunta(TDArespuesta,IdPregunta),
    answerGetId(TDArespuesta,IdRespuesta),
    answerGetUser(TDArespuesta,Username),
    answerGetDate(TDArespuesta,Date),
    answerGetLabels(TDArespuesta,Labels),
    answerGetStatus(TDArespuesta,Status),
    answerGetVotes(TDArespuesta,Votes),
    NuevosVotos is Votes+1,
    RespuestaModificada = [Respuesta,IdPregunta,IdRespuesta,Username,Date,Labels,Status,NuevosVotos].

%Agrega un voto negativo a un TDA Respuesta
answerAddNegativeVote(TDArespuesta,RespuestaModificada):-
    answerGetRespuesta(TDArespuesta,Respuesta),
    answerGetIdPregunta(TDArespuesta,IdPregunta),
    answerGetId(TDArespuesta,IdRespuesta),
    answerGetUser(TDArespuesta,Username),
    answerGetDate(TDArespuesta,Date),
    answerGetLabels(TDArespuesta,Labels),
    answerGetStatus(TDArespuesta,Status),
    answerGetVotes(TDArespuesta,Votes),
    NuevosVotos is Votes-1,
    RespuestaModificada = [Respuesta,IdPregunta,IdRespuesta,Username,Date,Labels,Status,NuevosVotos].
    

%Pertenencia

%Permite conocer si la lista de entrada es o no una respuesta
isAnswer(TDArespuesta):-
    length(TDArespuesta, 8).


/*
████████╗██████╗  █████╗     ██╗   ██╗███████╗██╗   ██╗ █████╗ ██████╗ ██╗ ██████╗ ███████╗
╚══██╔══╝██╔══██╗██╔══██╗    ██║   ██║██╔════╝██║   ██║██╔══██╗██╔══██╗██║██╔═══██╗██╔════╝
   ██║   ██║  ██║███████║    ██║   ██║███████╗██║   ██║███████║██████╔╝██║██║   ██║███████╗
   ██║   ██║  ██║██╔══██║    ██║   ██║╚════██║██║   ██║██╔══██║██╔══██╗██║██║   ██║╚════██║
   ██║   ██████╔╝██║  ██║    ╚██████╔╝███████║╚██████╔╝██║  ██║██║  ██║██║╚██████╔╝███████║
   ╚═╝   ╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚══════╝
*/

% Representacion:
% (string X string X(list entero)X entero)
% [usuario password [preguntas] reputacion]

% Constructor:

crearUsuario(Username,Password,Preguntas,Reputacion,SalidaUsuario):-
    SalidaUsuario = [Username,Password,Preguntas,Reputacion].

% Selectores:

userGetUsername([Username,_,_,_], Username).

userGetPassword([_,Password,_,_], Password).

userGetQuestions([_,_,Questions,_], Questions).

userGetReputation([_,_,_,Reputacion], Reputacion).

% Modificadores:

%Agrega una pregunta al usuario
userAddQuestion(TDAusuario,IdPregunta,ListaModificada):-
    userGetUsername(TDAusuario,Username),
    userGetPassword(TDAusuario,Password),
    userGetReputation(TDAusuario,Reputacion),
    userGetQuestions(TDAusuario,PreguntasUsuario),
    append(PreguntasUsuario,[IdPregunta],NuevaListaPreguntas),
    ListaModificada = [Username,Password,NuevaListaPreguntas,Reputacion].

%Añade 2 de reputacion al usuario
userAdd2reputation(TDAusuario,ListaModificada):-
    userGetUsername(TDAusuario,Username),
    userGetPassword(TDAusuario,Password),
    userGetReputation(TDAusuario,Reputacion),
    userGetQuestions(TDAusuario,PreguntasUsuario),
    NuevaReputacion is Reputacion+2,
    ListaModificada = [Username,Password,PreguntasUsuario,NuevaReputacion].

%Añade 15 de reputacion al usuario
userAdd15reputation(TDAusuario,ListaModificada):-
    userGetUsername(TDAusuario,Username),
    userGetPassword(TDAusuario,Password),
    userGetReputation(TDAusuario,Reputacion),
    userGetQuestions(TDAusuario,PreguntasUsuario),
    NuevaReputacion is Reputacion+15,
    ListaModificada = [Username,Password,PreguntasUsuario,NuevaReputacion].

%Añade 10 de reputacion al usuario
userAdd10reputation(TDAusuario,ListaModificada):-
    userGetUsername(TDAusuario,Username),
    userGetPassword(TDAusuario,Password),
    userGetReputation(TDAusuario,Reputacion),
    userGetQuestions(TDAusuario,PreguntasUsuario),
    NuevaReputacion is Reputacion+10,
    ListaModificada = [Username,Password,PreguntasUsuario,NuevaReputacion].

%Quita 2 de reputacion al usuario
userSubtract2reputation(TDAusuario,ListaModificada):-
    userGetUsername(TDAusuario,Username),
    userGetPassword(TDAusuario,Password),
    userGetReputation(TDAusuario,Reputacion),
    userGetQuestions(TDAusuario,PreguntasUsuario),
    NuevaReputacion is Reputacion-2,
    ListaModificada = [Username,Password,PreguntasUsuario,NuevaReputacion].

%Quita 1 de reputacion al usuario
userSubtract1reputation(TDAusuario,ListaModificada):-
    userGetUsername(TDAusuario,Username),
    userGetPassword(TDAusuario,Password),
    userGetReputation(TDAusuario,Reputacion),
    userGetQuestions(TDAusuario,PreguntasUsuario),
    NuevaReputacion is Reputacion-1,
    ListaModificada = [Username,Password,PreguntasUsuario,NuevaReputacion].


/*
██████╗  █████╗ ███████╗███████╗    ██████╗ ███████╗    ██╗  ██╗███████╗ ██████╗██╗  ██╗ ██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝██╔════╝    ██╔══██╗██╔════╝    ██║  ██║██╔════╝██╔════╝██║  ██║██╔═══██╗██╔════╝
██████╔╝███████║███████╗█████╗      ██║  ██║█████╗      ███████║█████╗  ██║     ███████║██║   ██║███████╗
██╔══██╗██╔══██║╚════██║██╔══╝      ██║  ██║██╔══╝      ██╔══██║██╔══╝  ██║     ██╔══██║██║   ██║╚════██║
██████╔╝██║  ██║███████║███████╗    ██████╔╝███████╗    ██║  ██║███████╗╚██████╗██║  ██║╚██████╔╝███████║
╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
*/


%A continuación se presenta la base de hechos compuesta por 2 stacks, cada uno tiene 4 usuarios registrados, 5 preguntas y 10 respuestas.

                 %Preguntas
stack1([[["Hola ¿como puedo hacer hola mundo en python?", 1, "israel", "22/11/2020", ["python"], "abierta", 0],
        ["En C ¿como puedo asignar memoria a un arreglo?", 2, "pedro", "23/11/2020", ["C", "memoria"], "abierta", 0],
        ["Hola soy nuevo, como se encuentran hoy ?", 3, "juan", "23/11/2020", ["comunidad"], "abierta", 0],
        ["Hola como puedo instalar una libreria en python?", 4, "maria", "24/11/2020", ["python", "libreria"], "abierta", 0],
        ["¿Prefieren el helado de chocolate o de frutilla?", 5, "juan", "24/11/2020", ["postre", "helado"], "abierta", 0]],
                %Respuestas
        [["Hola, puedes usar malloc para asignarle memoria", 2, 1, "israel", "23/11/2020", ["duda", "C"], "pendiente", 0],
        ["Intenta usar print(Hola mundo)", 1, 2, "pedro", "23/11/2020", ["python", "hola mundo"], "pendiente", 0],
        ["Tambien puedes asignar la cantidad de elementos del arreglo, como int *arreglo[100]", 2, 3, "maria", "23/11/2020", ["C", "duda"], "pendiente", 0],
        ["Me gusta mas el de frutilla", 5, 4, "maria", "24/11/2020", ["comunidad"], "pendiente", 0],
        ["en la cmd usa el comando pip install *nombreLibreria*", 4, 5, "israel", "24/11/2020", ["python", "pip"], "pendiente", 0],
        ["prefiero el chocolate", 5, 6, "israel", "24/11/2020", ["chocolate", "helado"], "pendiente", 0],
        ["Ahora mismo realizando el laboratorio del paradigma logico en prolog, ¿y tu?", 3, 7, "israel", "24/11/2020", ["comunidad","prolog"], "pendiente", 0],
        ["me encuentro bien, todo correcto", 3, 8, "maria", "25/11/2020", ["comunidad"], "pendiente", 0],
        ["prefiero el de menta, pero entre esos el de frutilla", 5, 9, "pedro", "25/11/2020", ["helados"], "pendiente", 0],
        ["podrias usar print, muestra cosas por pantalla", 1, 10, "juan", "25/11/2020", ["python", "duda"], "pendiente", 0]],
            %Usuarios
        [["israel", "qwerty", [1], 200], ["pedro", "123", [2], 200], ["juan", "asd", [3, 5], 200], ["maria", "hola123", [4], 200]],
            %Usuario Activo
        []]).



                 %Preguntas
stack2([[["Buenas, ¿como se puede hacer un comentario en Prolog ?", 1, "matias", "22/11/2020", ["prolog"], "abierta", 0],
        ["¿Como se crea una lista en python ?", 2, "albert", "23/11/2020", ["python", "listas"], "abierta", 0],
        ["¿Como puedo visualizar el stack de una manera mas comprensible?", 3, "pepe", "23/11/2020", ["stack"], "abierta", 0],
        ["Hola, ¿como creo una funcion en C?", 4, "mariana", "24/11/2020", ["C", "funciones"], "abierta", 0],
        ["¿Que distribucion de Linux prefieren?", 5, "albert", "24/11/2020", ["linux", "distribuciones"], "abierta", 0]],
                %Respuestas
        [["Hola, al igual que en prolog solo necesitas usar corchetes", 2, 1, "matias", "23/11/2020", ["duda", "python"], "pendiente", 0],
        ["para hacer comentarios puedes ocupar el caracter de porcentaje % ", 1, 2, "albert", "23/11/2020", ["prolog", "comentarios"], "pendiente", 0],
        ["lista = [] eso deberia crear una lista vacia en python", 2, 3, "mariana", "23/11/2020", ["python", "listas"], "pendiente", 0],
        ["Me gusta Ubuntu", 5, 4, "mariana", "24/11/2020", ["linux"], "pendiente", 0],
        ["Primero debes indicar el tipo de dato que retornara, luego el nombre y las entradas", 4, 5, "matias", "24/11/2020", ["C", "funciones"], "pendiente", 0],
        ["Me gusta Debian", 5, 6, "matias", "24/11/2020", ["debian", "linux"], "pendiente", 0],
        ["Se encuentra implementado un predicado llamado stackToString gracias a el es posible lo que solicitas", 3, 7, "matias", "24/11/2020", ["string","prolog"], "pendiente", 0],
        ["stackToString(Stack,StackStr) es la consulta del predicado", 3, 8, "mariana", "25/11/2020", ["prolog"], "pendiente", 0],
        ["Personalmente me gusta Fedora", 5, 9, "pepe", "25/11/2020", ["linux"], "pendiente", 0],
        ["Tambien puedes usar /* y */ para un comentario de mas de una linea", 1, 10, "pepe", "25/11/2020", ["prolog", "comentarios"], "pendiente", 0]],
            %Usuarios
        [["matias", "qwerty", [1], 200], ["albert", "123", [2,5], 200], ["pepe", "asd", [3], 200], ["mariana", "hola123", [4], 200]],
            %Usuario Activo
        []]).

/*
██████╗ ██████╗ ███████╗██████╗ ██╗ ██████╗ █████╗ ██████╗  ██████╗ ███████╗                                                  
██╔══██╗██╔══██╗██╔════╝██╔══██╗██║██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝                                                  
██████╔╝██████╔╝█████╗  ██║  ██║██║██║     ███████║██║  ██║██║   ██║███████╗                                                  
██╔═══╝ ██╔══██╗██╔══╝  ██║  ██║██║██║     ██╔══██║██║  ██║██║   ██║╚════██║                                                  
██║     ██║  ██║███████╗██████╔╝██║╚██████╗██║  ██║██████╔╝╚██████╔╝███████║                                                  
╚═╝     ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚══════╝                                                  
                                                                                                                              
 ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗███╗   ███╗███████╗███╗   ██╗████████╗ █████╗ ██████╗ ██╗ ██████╗ ███████╗
██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔══██╗██╔══██╗██║██╔═══██╗██╔════╝
██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗  ██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ███████║██████╔╝██║██║   ██║███████╗
██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝  ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ██╔══██║██╔══██╗██║██║   ██║╚════██║
╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ██║  ██║██║  ██║██║╚██████╔╝███████║
 ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚══════╝
*/                                                                                                                        

%predicado que permite encontrar si hay un elemento en una sublista del stack
buscarElemento([[E|_]|_],E).
buscarElemento([[_|Cola1]|Cola2],E) :-
    buscarElemento([Cola1|Cola2],E).
buscarElemento([[]|Cola2],E) :-
    buscarElemento(Cola2,E).

%Predicado que verifica si el usuario se encuentra registrado o no.
existeUser([Cabeza|_],User):-
    userGetUsername(Cabeza,Username),
    (User = Username).
existeUser([_|Cola], User) :- existeUser(Cola, User).

%Predicado que verifica si el usuario y su contraseña coinciden.
existeUserPassword([Cabeza|_],User,Pass):-
    userGetUsername(Cabeza,Username),
    userGetPassword(Cabeza,Password),
    (User = Username),
    (Pass = Password).
existeUserPassword([_|Cola], User, Pass) :- existeUserPassword(Cola, User, Pass).

%Predicado que permite ver quien es el usuario conectado
nombreUsuarioActivo([Nombre],Nombre).

%Retorna las preguntas de un usuario
buscarPreguntasUsuario([Cabeza|_],User,Preguntas):-
    userGetUsername(Cabeza,Username),
    (User = Username),
    userGetQuestions(Cabeza,SalidaPreguntas),
    (Preguntas = SalidaPreguntas).
buscarPreguntasUsuario([_|Cola], User,Preguntas) :- buscarPreguntasUsuario(Cola, User,Preguntas).

%Retorna la lista con toda la informacion de un usuario
buscarListaUsuario([Cabeza|_],User,Lista):-
    userGetUsername(Cabeza,Username),
    (User = Username),
    (Cabeza = Lista).
buscarListaUsuario([_|Cola], User,Preguntas) :- buscarListaUsuario(Cola,User,Preguntas).

%Reemplaza un valor de una lista por otro asignado.
reemplazar(_, [], _, []).
reemplazar(ElementoBuscado, [ElementoBuscado|Cola], ReemplazarPor, [ReemplazarPor|Cola]):- !.
reemplazar(ElementoBuscado, [CElemento|Cola], ReemplazarPor, [CElemento|ColaR]):-
  reemplazar(ElementoBuscado, Cola, ReemplazarPor, ColaR).

%Busca la existencia de un id en la lista de preguntas
existePregunta([Cabeza|_],IdBuscado):-
    questionGetId(Cabeza,IdPregunta),
    (IdBuscado = IdPregunta).
existePregunta([_|Cola], IdBuscado) :- existePregunta(Cola, IdBuscado).

%Busca la existencia de un id en la lista de respuestas
existeRespuesta([Cabeza|_],IdBuscado):-
    answerGetId(Cabeza,IdRespuesta),
    (IdBuscado = IdRespuesta).
existeRespuesta([_|Cola], IdBuscado) :- existeRespuesta(Cola, IdBuscado).

%Busca la lista de una pregunta por su id
buscarPreguntaPorId([Cabeza|_],IdBuscado,ListaPregunta):-
    questionGetId(Cabeza,IdPregunta),
    (IdBuscado = IdPregunta),
    (Cabeza = ListaPregunta).
buscarPreguntaPorId([_|Cola],IdBuscado,ListaPregunta) :- buscarPreguntaPorId(Cola,IdBuscado,ListaPregunta).

%busca el nombre del usuario que hizo la pregunta por id
buscarUsuariodePreguntaPorId([Cabeza|_],IdBuscado,Username):-
    questionGetId(Cabeza,IdPregunta),
    questionGetUser(Cabeza,Usuario),
    (IdBuscado = IdPregunta),
    (Usuario = Username).
buscarUsuariodePreguntaPorId([_|Cola],IdBuscado,Username) :- buscarUsuariodePreguntaPorId(Cola,IdBuscado,Username).

%busca el Tda respuesta en la lista de Respuestas por su id
buscarListaRespuestaPorIds([Cabeza|_],IdPreguntaBuscada,IdRespuestaBuscada,ListaRespuesta):-
    answerGetIdPregunta(Cabeza,IdPregunta),
    answerGetId(Cabeza,IdRespuesta),
    (IdPreguntaBuscada = IdPregunta),
    (IdRespuestaBuscada = IdRespuesta),
    (Cabeza = ListaRespuesta).
buscarListaRespuestaPorIds([_|Cola],IdPreguntaBuscada,IdRespuestaBuscada,ListaRespuesta) :- buscarListaRespuestaPorIds(Cola,IdPreguntaBuscada,IdRespuestaBuscada,ListaRespuesta).

%Dada un id de respuesta, retorna el nombre del autor de la respuesta
buscarUsuariodeRespuestaPorId([Cabeza|_],IdBuscado,Username):-
    answerGetUser(Cabeza,Usuario),
    answerGetId(Cabeza,IdRespuesta),
    (IdBuscado = IdRespuesta),
    (Usuario = Username).
buscarUsuariodeRespuestaPorId([_|Cola],IdBuscado,Username) :- buscarUsuariodeRespuestaPorId(Cola,IdBuscado,Username).

%Predicado complementario usada para el predicado vote
getQuestion(Stack,IdPregunta,Pregunta):-
    stackGetQuestions(Stack,ListaPreguntas),
    buscarPreguntaPorId(ListaPreguntas,IdPregunta,Pregunta).

%Predicado complementario usada para el predicado vote
getAnswer(Stack,IdPregunta,IdRespuesta,Respuesta):-
    stackGetAnswers(Stack,ListaRespuestas),
    buscarListaRespuestaPorIds(ListaRespuestas,IdPregunta,IdRespuesta,Respuesta).


%Filtra y consigue todas las respuestas a cierto id de pregunta
getAllAnswersToAQuestion(ListaRespuestas,IdPregunta,ListaConRespuestas) :-
    findall(M, ( member(M, ListaRespuestas), call(answerGetIdPregunta(M,IdPregunta))), ListaConRespuestas).


%Convierte toda la parte de stack de respuestas a string
convertirRespuestasDeUnaPreguntaAString([],"").
convertirRespuestasDeUnaPreguntaAString([Cabeza|Cola],StringRespuestasResultante):-
    answerGetRespuesta(Cabeza,Respuesta),
    answerGetIdPregunta(Cabeza,IdPreguntaQueResponde),
    answerGetId(Cabeza,IdRespuesta),
    answerGetUser(Cabeza,Username),
    answerGetDate(Cabeza,Fecha),
    answerGetLabels(Cabeza,Etiquetas),
    answerGetStatus(Cabeza,Status),
    answerGetVotes(Cabeza,Votes),
    atom_string(Respuesta,StringRespuesta),
    atom_string(IdPreguntaQueResponde,StringIdPreguntaQueResponde),
    atom_string(IdRespuesta,StringIdRespuesta),
    atom_string(Username,StringUsername),
    atom_string(Fecha,StringFecha),
    atomic_list_concat(Etiquetas,", ",AtomoEtiquetas),
    atom_string(AtomoEtiquetas,StringEtiquetas),
    atom_string(Status,StringStatus),
    atom_string(Votes,StringVotes),
    string_concat("        Respuesta:   Id: ",StringIdRespuesta,S1),
    string_concat(S1,"   Id al que responde: ",S2),
    string_concat(S2, StringIdPreguntaQueResponde,S3),
    string_concat(S3,"    Fecha de respuesta: ",S4),
    string_concat(S4, StringFecha,S5),
    string_concat(S5,"   Votos: ",S6),
    string_concat(S6, StringVotes,S7),
    string_concat(S7,"   Estado: ",S8),
    string_concat(S8,StringStatus,S9),
    string_concat(S9,"\n",S10),
    string_concat(S10,"            ",S11),
    string_concat(S11,StringRespuesta,S12),
    string_concat(S12,"\n",S13),
    string_concat(S13,"            Etiquetas: ",S14),
    string_concat(S14, StringEtiquetas,S15),
    string_concat(S15,"    Autor: ",S16),
    string_concat(S16, StringUsername,S17),
    string_concat(S17," \n \n",S18),
    convertirRespuestasDeUnaPreguntaAString(Cola,StringRespuestaCola),
    string_concat(S18,StringRespuestaCola,StringRespuestasResultante).

%Convierte todas las preguntas con sus respectivas respuestas a a string
convertirPreguntasRespuestasAString([],_,"").
convertirPreguntasRespuestasAString([Cabeza|Cola],Respuestas,StringResultante):-
    questionGetPregunta(Cabeza,Pregunta),
    questionGetId(Cabeza,IdPregunta),
    questionGetUser(Cabeza,Username),
    questionGetDate(Cabeza,Date),
    questionGetLabels(Cabeza,Etiquetas),
    questionGetStatus(Cabeza,Status),
    questionGetVotes(Cabeza,Votes),
    atom_string(Pregunta,StringPregunta),
    atom_string(IdPregunta,StringIdPregunta),
    atom_string(Username,StringUsername),
    atom_string(Date,StringDate),
    atomic_list_concat(Etiquetas,", ",AtomoEtiquetas),
    atom_string(AtomoEtiquetas,StringEtiquetas),
    atom_string(Status,StringStatus),
    atom_string(Votes,StringVotes),
    string_concat("\n Pregunta:   Id: ",StringIdPregunta,S1),
    string_concat(S1,"   Fecha Publicacion: ",S2),
    string_concat(S2,StringDate,S3),
    string_concat(S3,"   Votos: ",S4),
    string_concat(S4,StringVotes,S5),
    string_concat(S5,"   Estado: ",S6),
    string_concat(S6,StringStatus,S7),
    string_concat(S7," \n",S8),
    string_concat(S8,"   ",S9),
    string_concat(S9,StringPregunta,S10),
    string_concat(S10," \n",S11),
    string_concat(S11,"   Etiquetas: ",S12),
    string_concat(S12,StringEtiquetas,S13),
    string_concat(S13,"   Autor: ",S14),
    string_concat(S14,StringUsername,S15),
    string_concat(S15," \n \n",S16),
    getAllAnswersToAQuestion(Respuestas,IdPregunta,ListaConRespuestasALaPregunta),
    convertirRespuestasDeUnaPreguntaAString(ListaConRespuestasALaPregunta,StringRespuestas),
    string_concat(S16,StringRespuestas,S17),
    convertirPreguntasRespuestasAString(Cola,Respuestas,StringPreguntaCola),
    string_concat(S17,StringPreguntaCola,StringResultante).

%Convierte toda la info de los usuarios a String
convertirUsuariosAString([],"").
convertirUsuariosAString([Cabeza|Cola],StringUsuariosResultante):-
    userGetUsername(Cabeza,Username),
    userGetReputation(Cabeza,Reputacion),
    userGetQuestions(Cabeza,PreguntasUsuario),
    atom_string(Username,StringUsername),
    atom_string(Reputacion,StringReputacion),
    atomic_list_concat(PreguntasUsuario,", ",AtomoPreguntas),
    atom_string(AtomoPreguntas,StringPreguntasUsuario),
    string_concat("Usuario:\n   Username: ",StringUsername,S1),
    string_concat(S1,"   Reputacion: ",S2),
    string_concat(S2,StringReputacion,S3),
    string_concat(S3,"   Preguntas Realizadas(Id's): ",S4),
    string_concat(S4,StringPreguntasUsuario,S5),
    string_concat(S5,"\n",S6),
    convertirUsuariosAString(Cola,StringSiguientesUsuarios),
    string_concat(S6,StringSiguientesUsuarios,StringUsuariosResultante).

%Convertir preguntas y respuestas a string usando una lista de id's de pregunta
convertirPreguntasRespuestasAStringPorId([],_,_,"").
convertirPreguntasRespuestasAStringPorId([Cabeza|Cola],Preguntas,Respuestas,StringResultante):-
    %Se debe buscar la pregunta a la que corresponde el id, entonces:
    %Se consigue la pregunta
    buscarPreguntaPorId(Preguntas,Cabeza,ListaPregunta),
    questionGetPregunta(ListaPregunta,Pregunta),
    questionGetId(ListaPregunta,IdPregunta),
    questionGetUser(ListaPregunta,Username),
    questionGetDate(ListaPregunta,Date),
    questionGetLabels(ListaPregunta,Etiquetas),
    questionGetStatus(ListaPregunta,Status),
    questionGetVotes(ListaPregunta,Votes),
    atom_string(Pregunta,StringPregunta),
    atom_string(IdPregunta,StringIdPregunta),
    atom_string(Username,StringUsername),
    atom_string(Date,StringDate),
    atomic_list_concat(Etiquetas,", ",AtomoEtiquetas),
    atom_string(AtomoEtiquetas,StringEtiquetas),
    atom_string(Status,StringStatus),
    atom_string(Votes,StringVotes),
    string_concat("\n Pregunta:   Id: ",StringIdPregunta,S1),
    string_concat(S1,"   Fecha Publicacion: ",S2),
    string_concat(S2,StringDate,S3),
    string_concat(S3,"   Votos: ",S4),
    string_concat(S4,StringVotes,S5),
    string_concat(S5,"   Estado: ",S6),
    string_concat(S6,StringStatus,S7),
    string_concat(S7," \n",S8),
    string_concat(S8,"   ",S9),
    string_concat(S9,StringPregunta,S10),
    string_concat(S10," \n",S11),
    string_concat(S11,"   Etiquetas: ",S12),
    string_concat(S12,StringEtiquetas,S13),
    string_concat(S13,"   Autor: ",S14),
    string_concat(S14,StringUsername,S15),
    string_concat(S15," \n",S16),
    getAllAnswersToAQuestion(Respuestas,IdPregunta,ListaConRespuestasALaPregunta),
    convertirRespuestasDeUnaPreguntaAString(ListaConRespuestasALaPregunta,StringRespuestas),
    string_concat(S16,StringRespuestas,S17),
    convertirPreguntasRespuestasAStringPorId(Cola,Preguntas,Respuestas,StringPreguntaCola),
    string_concat(S17,StringPreguntaCola,StringResultante).

/*
██████╗ ██████╗ ███████╗██████╗ ██╗ ██████╗ █████╗ ██████╗  ██████╗ ███████╗    
██╔══██╗██╔══██╗██╔════╝██╔══██╗██║██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔════╝    
██████╔╝██████╔╝█████╗  ██║  ██║██║██║     ███████║██║  ██║██║   ██║███████╗    
██╔═══╝ ██╔══██╗██╔══╝  ██║  ██║██║██║     ██╔══██║██║  ██║██║   ██║╚════██║    
██║     ██║  ██║███████╗██████╔╝██║╚██████╗██║  ██║██████╔╝╚██████╔╝███████║    
╚═╝     ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚══════╝    
                                                                                
██████╗ ███████╗ ██████╗ ██╗   ██╗███████╗██████╗ ██╗██████╗  ██████╗ ███████╗  
██╔══██╗██╔════╝██╔═══██╗██║   ██║██╔════╝██╔══██╗██║██╔══██╗██╔═══██╗██╔════╝  
██████╔╝█████╗  ██║   ██║██║   ██║█████╗  ██████╔╝██║██║  ██║██║   ██║███████╗  
██╔══██╗██╔══╝  ██║▄▄ ██║██║   ██║██╔══╝  ██╔══██╗██║██║  ██║██║   ██║╚════██║  
██║  ██║███████╗╚██████╔╝╚██████╔╝███████╗██║  ██║██║██████╔╝╚██████╔╝███████║  
╚═╝  ╚═╝╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝╚═════╝  ╚═════╝ ╚══════╝  
                                                                                
*/                                                                             

stackRegister(Stack,Username,Password,Stack2):-
    string(Username),
    string(Password),
    stackGetQuestions(Stack, Preguntas),
    stackGetAnswers(Stack, Respuestas),
    stackGetUsers(Stack, Usuarios),
    not(existeUser(Usuarios,Username)),!,
    crearUsuario(Username,Password,[],200,SalidaUsuario),
    append(Usuarios, [SalidaUsuario], ListaResultante),
    stackGetActiveUser(Stack, ActiveUser),
    crearStack(Preguntas,Respuestas,ListaResultante,ActiveUser,Stack2).

stackLogin(Stack,Username,Password,Stack2):-
    string(Username),
    string(Password),
    stackGetQuestions(Stack, Preguntas),
    stackGetAnswers(Stack, Respuestas),
    stackGetUsers(Stack, Usuarios),
    stackGetActiveUser(Stack, ActiveUser),
    existeUserPassword(Usuarios,Username,Password),!,
    append(ActiveUser,[Username],ListaResultante),
    crearStack(Preguntas,Respuestas,Usuarios,ListaResultante,Stack2).

ask(Stack,Fecha,TextoPregunta,ListaEtiquetas,Stack2):-
    string(Fecha),
    string(TextoPregunta),
    is_list(ListaEtiquetas),
    %Se consiguen las sub listas del Stack
    stackGetQuestions(Stack,Preguntas),
    stackGetAnswers(Stack,Respuestas),
    stackGetUsers(Stack,Usuarios),
    stackGetActiveUser(Stack, ActiveUser),
    %Se verifica si hay un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    not(CantidadUsuariosConectados = 0),!,
    %Se crea el id de pregunta
    length(Preguntas,CantidadPreguntas),
    Id is CantidadPreguntas+1,
    %Se consigue al autor de la pregunta, que es el usuario Conectado
    nombreUsuarioActivo(ActiveUser,Autor),
    crearPregunta(TextoPregunta,Id,Autor,Fecha,ListaEtiquetas,"abierta",0,SalidaPregunta),
    %Se agrega la pregunta a las preguntas ya disponibles del stack
    append(Preguntas,[SalidaPregunta],ListaPreguntasResultante),
    %Se agrega el id de la pregunta al usuario que la hizo
    buscarListaUsuario(Usuarios,Autor,ListaUsuario),
    userAddQuestion(ListaUsuario,Id,ListaIdInsertado),
    reemplazar(ListaUsuario,Usuarios,ListaIdInsertado,ListaUsuariosResultante),
    %Finalmente se crea el stack
    crearStack(ListaPreguntasResultante,Respuestas,ListaUsuariosResultante,[],Stack2).


answer(Stack,Fecha,IdPreguntaQueResponde,TextoRespuesta,ListaEtiquetas,Stack2):-
    string(Fecha),
    string(TextoRespuesta),
    is_list(ListaEtiquetas),
    %Se consiguen las sub listas del Stack
    stackGetQuestions(Stack,Preguntas),
    stackGetAnswers(Stack,Respuestas),
    stackGetUsers(Stack,Usuarios),
    stackGetActiveUser(Stack, ActiveUser),
    %Se verifica si hay un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    not(CantidadUsuariosConectados = 0),!,
    %Se verifica si existe la pregunta a la que se responde
    existePregunta(Preguntas,IdPreguntaQueResponde),!,
    %Se crea el id de respuesta
    length(Respuestas, CantidadRespuestas),
    IdRespuesta is CantidadRespuestas+1,
    %Se consigue al autor de la respuesta, que es el usuario conectado
    nombreUsuarioActivo(ActiveUser,Autor),
    crearRespuesta(TextoRespuesta,IdPreguntaQueResponde,IdRespuesta,Autor,Fecha,ListaEtiquetas,"pendiente",0,SalidaRespuesta),
    append(Respuestas,[SalidaRespuesta],ListaRespuestasResultante),
    crearStack(Preguntas,ListaRespuestasResultante,Usuarios,[],Stack2).

accept(Stack,IdPregunta,IdRespuesta,Stack2):-
    integer(IdPregunta),
    integer(IdRespuesta),
    %Se consiguen las sub listas del Stack
    stackGetQuestions(Stack,Preguntas),
    stackGetAnswers(Stack,Respuestas),
    stackGetUsers(Stack,Usuarios),
    stackGetActiveUser(Stack, ActiveUser),
    %Se verifica si hay un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    not(CantidadUsuariosConectados = 0),!,
    %Se verifica si existe la pregunta que se quiere aceptar
    existePregunta(Preguntas,IdPregunta),!,
    existeRespuesta(Respuestas,IdRespuesta),!,
    %Se consigue al autor de la respuesta, que es el usuario conectado
    nombreUsuarioActivo(ActiveUser,Autor),
    %Se verifica que la pregunta que sera aceptada sea una pregunta del usuario conectado
    buscarUsuariodePreguntaPorId(Preguntas,IdPregunta,UsuarioQueHizoLaPregunta),
    (Autor = UsuarioQueHizoLaPregunta),!,
    %Se consigue la lista de la pregunta
    buscarPreguntaPorId(Preguntas,IdPregunta,ListaPregunta),
    %Se cierra la pregunta
    closeQuestion(ListaPregunta,PreguntaCerrada),
    %Se actualiza el stack de preguntas con la pregunta cerrada
    reemplazar(ListaPregunta,Preguntas,PreguntaCerrada,ListaPreguntasResultante),
    %Se conseguira la lista de respuesta que fue aceptada
    buscarListaRespuestaPorIds(Respuestas,IdPregunta,IdRespuesta,ListaRespuestaEncontrada),
    %Se marcara como aceptada la respuesta
    aceptarRespuesta(ListaRespuestaEncontrada,RespuestaModificada),
    %Se actualiza el stack de respuestas con la respuesta cerrada
    reemplazar(ListaRespuestaEncontrada,Respuestas,RespuestaModificada,ListaRespuestaResultante),
    %Se debe dar 2 de reputacion al usuario que acepto la respuesta
    buscarListaUsuario(Usuarios,UsuarioQueHizoLaPregunta,ListaUsuario),
    userAdd2reputation(ListaUsuario,UsuarioQuePreguntaConReputacionActualizada),
    %Se actualiza el stack de usuarios con el usuario con reputacion aumentada
    reemplazar(ListaUsuario,Usuarios,UsuarioQuePreguntaConReputacionActualizada,ListaUsuariosActualizada),
    %se debe dar 15 de reputacion al usuario cuya respuesta fue aceptada, primero se busca el nombre del usuario que recibira la recompensa
    buscarUsuariodeRespuestaPorId(ListaRespuestaResultante,IdRespuesta,NombreUsuario),
    buscarListaUsuario(ListaUsuariosActualizada,NombreUsuario,ListaUsuario2),
    userAdd15reputation(ListaUsuario2,UserCon15ReputacionAgregada),
    %Se actualiza el stack de usaurios con el usuario con reputacion aumentada
    reemplazar(ListaUsuario2,ListaUsuariosActualizada,UserCon15ReputacionAgregada,TDAUsuariosActualizados),
    %Finalmente se crea el stack actualizado
    crearStack(ListaPreguntasResultante,ListaRespuestaResultante,TDAUsuariosActualizados,[],Stack2).

%Caso en el cual se convierte a string todo el string al no haber un usuario conectado
stackToString(Stack,StackStr):-
    stackGetActiveUser(Stack, ActiveUser),
    %Se verifica que no exista un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    CantidadUsuariosConectados = 0,
    %Se consiguen los datos del stack
    stackGetQuestions(Stack,Preguntas),
    stackGetAnswers(Stack,Respuestas),
    stackGetUsers(Stack,Usuarios),
    %Primero convertir a string y mostrar toda la info de pregunta y respuestas
    convertirPreguntasRespuestasAString(Preguntas,Respuestas,StringPreguntasRespuestas),
    string_concat(StringPreguntasRespuestas,"\n",S1),
    string_concat(S1,"Informacion de usuarios registrados en el foro: \n", S2),
    %Se concatenan los strings Preguntas/Respuestas y de usuarios
    convertirUsuariosAString(Usuarios,StringUsuariosResultante),
    string_concat(S2,StringUsuariosResultante,StackStr).

%Caso en el cual se convierte a string solo la informacion de un usuario
stackToString(Stack,StackStr):-
    stackGetActiveUser(Stack,ActiveUser),
    %Se verifica que exista un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    not(CantidadUsuariosConectados = 0),!,
    %Se consigue el username del usuario conectado
    nombreUsuarioActivo(ActiveUser,UsernameActivo),
    %Se consigue la lista de Usuarios registrados
    stackGetUsers(Stack,Usuarios),
    stackGetAnswers(Stack,Respuestas),
    stackGetQuestions(Stack,Preguntas),
    %Se buscara la lista de preguntas que ese usuario ha realizado
    buscarPreguntasUsuario(Usuarios,UsernameActivo,IdPreguntasHechasPorElUsuario),
    %Se convertiran sus preguntas con sus respectivas respuestas a string
    convertirPreguntasRespuestasAStringPorId(IdPreguntasHechasPorElUsuario,Preguntas,Respuestas,StringPreguntasRespuestasUsuario),
    %A continuacion se conseguirá su informacion de usuario:
    buscarListaUsuario(Usuarios,UsernameActivo,ListaUsernameActivo),
    string_concat("A continuacion se mostrara la informacion del usuario conectado:\nPreguntas hechas por el usuario:\n ",StringPreguntasRespuestasUsuario,S1),
    string_concat(S1,"\nLa informacion del perfil del usuario es la siguiente:\n",S2),
    userGetReputation(ListaUsernameActivo,Reputacion),
    userGetQuestions(ListaUsernameActivo,PreguntasUsuario),
    atom_string(UsernameActivo,StringUsername),
    atom_string(Reputacion,StringReputacion),
    atomic_list_concat(PreguntasUsuario,", ",AtomoPreguntas),
    atom_string(AtomoPreguntas,StringPreguntasUsuario),
    string_concat(S2,"Usuario:\n   Username: ",S3),
    string_concat(S3,StringUsername,S4),
    string_concat(S4,"   Reputacion: ",S5),
    string_concat(S5,StringReputacion,S6),
    string_concat(S6,"   Preguntas Realizadas(Id's): ",S7),
    string_concat(S7,StringPreguntasUsuario,S8),
    string_concat(S8,"\n",StackStr).


%Vote Positivo para Preguntas
vote(Stack,TDAPreguntaORespuesta,Voto,Stack2):-
    stackGetActiveUser(Stack,ActiveUser),
    %Se verifica si hay un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    not(CantidadUsuariosConectados = 0),
    %Se verificara si es una pregunta
    isQuestion(TDAPreguntaORespuesta),
    %Se verificara si es voto positivo
    (Voto = true),
    %Se debe sumar un voto positivo a la pregunta
    questionAddPositiveVote(TDAPreguntaORespuesta,PreguntaConVotoActualizado),
    %Se consigue la lista con preguntas del stack
    stackGetQuestions(Stack,Preguntas),
    %Se reemplaza el antiguo TDA pregunta por el nuevo TDA pregunta con el voto actualizado
    reemplazar(TDAPreguntaORespuesta,Preguntas,PreguntaConVotoActualizado,NuevaListaPreguntas),
    %Ahora se debe añadir +10 de reputacion al usuario que su pregunta fue votada a favor
    %Se busca al usuario cuya pregunta fue votada a favor
    questionGetUser(PreguntaConVotoActualizado,Username),
    %Se consigue la lista de usuarios del stack
    stackGetUsers(Stack,Usuarios),
    %se consigue la lista del usuario que recibira la reputacion
    buscarListaUsuario(Usuarios,Username,ListaUsuario),
    %Se le añade 10 de reputacion a ese usuario
    userAdd10reputation(ListaUsuario,TDAUsuarioConReputacionAgregada),
    %Se reemplaza el antiguo Tda usuario, por el que ahora tiene la reputacion agregada
    reemplazar(ListaUsuario,Usuarios,TDAUsuarioConReputacionAgregada,NuevaListaUsuarios),
    %Se arma el nuevo stack actualizado
    stackGetAnswers(Stack,Respuestas),
    crearStack(NuevaListaPreguntas,Respuestas,NuevaListaUsuarios,[],Stack2).


%Vote Negativo para Preguntas
vote(Stack,TDAPreguntaORespuesta,Voto,Stack2):-
    stackGetActiveUser(Stack,ActiveUser),
    %Se verifica si hay un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    not(CantidadUsuariosConectados = 0),
    %Se verificara si es una pregunta
    isQuestion(TDAPreguntaORespuesta),
    %Se verificara si es voto negativo
    (Voto = false),
    %Se debe restar un voto a la pregunta
    questionAddNegativeVote(TDAPreguntaORespuesta,PreguntaConVotoActualizado),
    %Se consigue la lista con preguntas del stack
    stackGetQuestions(Stack,Preguntas),
    %Se reemplaza el antiguo TDA pregunta por el nuevo TDA pregunta con el voto actualizado
    reemplazar(TDAPreguntaORespuesta,Preguntas,PreguntaConVotoActualizado,NuevaListaPreguntas),
    %Ahora se debe restar -2 de reputacion al usuario que su pregunta fue votada en contra
    %Se busca al usuario cuya pregunta fue votada en contra
    questionGetUser(PreguntaConVotoActualizado,Username),
    %Se consigue la lista de usuarios del stack
    stackGetUsers(Stack,Usuarios),
    %Se consigue la lista del usuario que recibira la reputacion
    buscarListaUsuario(Usuarios,Username,ListaUsuario),
    %Se le resta 2 de reputacion a ese usuario
    userSubtract2reputation(ListaUsuario,TDAUsuarioConReputacionQuitada),
    %Se reemplaza el antiguo Tda usuario, por el que ahora tiene la reputacion agregada
    reemplazar(ListaUsuario,Usuarios,TDAUsuarioConReputacionQuitada,NuevaListaUsuarios),
    %Se arma el nuevo stack actualizado
    stackGetAnswers(Stack,Respuestas),
    crearStack(NuevaListaPreguntas,Respuestas,NuevaListaUsuarios,[],Stack2).

%Vote Positivo para Respuestas
vote(Stack,TDAPreguntaORespuesta,Voto,Stack2):-
    stackGetActiveUser(Stack,ActiveUser),
    %Se verifica si hay un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    not(CantidadUsuariosConectados = 0),
    %Se verificara si es una respuesta
    isAnswer(TDAPreguntaORespuesta),
    %Se verificara si es voto positivo
    (Voto = true),
    %Se debe añadir un voto a la respuesta
    answerAddPositiveVote(TDAPreguntaORespuesta,RespuestaConVotoActualizado),
    %Se consigue la lista con respuestas del stack
    stackGetAnswers(Stack,Respuestas),
    %Se reemplaza el antiguo TDA respuesta por el nuevo TDA respuesta con el voto actualizado
    reemplazar(TDAPreguntaORespuesta,Respuestas,RespuestaConVotoActualizado,NuevaListaRespuestas),
    %Ahora se debe sumar +10 de reputacion al usuario cuya respuesta fue votada a favor
    %Se busca al usuatio cuya pregunta fue votada a favcor
    answerGetUser(RespuestaConVotoActualizado,Username),
    %Se consigue la lista de usuarios del stack
    stackGetUsers(Stack,Usuarios),
    %Se consigue la lista del usuario que recibira la reputacion
    buscarListaUsuario(Usuarios,Username,ListaUsuario),
    %Se le suma 10 de reputacion a ese usuario
    userAdd10reputation(ListaUsuario,TDAUsuarioConReputacionAgregada),
    %Se reemplaza el antiguo TDA usuario, por el que ahora tiene la reputacion agregada
    reemplazar(ListaUsuario,Usuarios,TDAUsuarioConReputacionAgregada,NuevaListaUsuarios),
    %Se crea el nuevo stack actualizado
    stackGetQuestions(Stack,Preguntas),
    crearStack(Preguntas,NuevaListaRespuestas,NuevaListaUsuarios,[],Stack2).

%Vote Negativo para Respuestas
vote(Stack,TDAPreguntaORespuesta,Voto,Stack2):-
    stackGetActiveUser(Stack,ActiveUser),
    %Se verifica si hay un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    not(CantidadUsuariosConectados = 0),
    %Se verificara si es una respuesta
    isAnswer(TDAPreguntaORespuesta),
    %Se verificara si es voto negativo
    (Voto = false),
    %Se debe restar un voto a la respuesta
    answerAddNegativeVote(TDAPreguntaORespuesta,RespuestaConVotoActualizado),
    %Se consigue la lista con respuestas del stack
    stackGetAnswers(Stack,Respuestas),
    %Se reemplaza el antiguo TDA respuesta por el nuevo TDA respuesta con el voto actualizado
    reemplazar(TDAPreguntaORespuesta,Respuestas,RespuestaConVotoActualizado,NuevaListaRespuestas),
    %Ahora se debe restar -2 de reputacion al usuario cuya respuesta fue votada en contra
    %Se busca al usuatio cuya pregunta fue votada en contra
    answerGetUser(RespuestaConVotoActualizado,Username),
    %Se consigue la lista de usuarios del stack
    stackGetUsers(Stack,Usuarios),
    %Se consigue la lista del usuario que perdera la reputacion
    buscarListaUsuario(Usuarios,Username,ListaUsuario),
    %Se le resta 2 de reputacion a ese usuario
    userSubtract2reputation(ListaUsuario,TDAUsuarioConReputacionRestada),
    %Se reemplaza el antiguo TDA usuario, por el que ahora tiene la reputacion restada
    reemplazar(ListaUsuario,Usuarios,TDAUsuarioConReputacionRestada,NuevaListaUsuarios),
    %Tambien se debe quitar 1 de reputacion al usuario que ejecuto el voto en contra de una respuesta
    %Se consigue el nombre del usuario activo
    nombreUsuarioActivo(ActiveUser,UsernameActivo),
    %Se consigue el TDA Usuario del usuario activo
    buscarListaUsuario(NuevaListaUsuarios,UsernameActivo,ListaUsuarioActivo),
    %Se le resta 1 de reputacion al usuario por haber votado en contra de la respuesta
    userSubtract1reputation(ListaUsuarioActivo,TDAUsuarioActivoConReputacionRestada),
    %Se reemplaza el antiguo TDA usuario, por el que tiene reputacion restada
    reemplazar(ListaUsuarioActivo,NuevaListaUsuarios,TDAUsuarioActivoConReputacionRestada,ListaUsuariosActualizada),
    %Finalmente se crea el nuevo stack actualizado
    stackGetQuestions(Stack,Preguntas),
    crearStack(Preguntas,NuevaListaRespuestas,ListaUsuariosActualizada,[],Stack2).



/*
███████╗     ██╗███████╗███╗   ███╗██████╗ ██╗      ██████╗ ███████╗
██╔════╝     ██║██╔════╝████╗ ████║██╔══██╗██║     ██╔═══██╗██╔════╝
█████╗       ██║█████╗  ██╔████╔██║██████╔╝██║     ██║   ██║███████╗
██╔══╝  ██   ██║██╔══╝  ██║╚██╔╝██║██╔═══╝ ██║     ██║   ██║╚════██║
███████╗╚█████╔╝███████╗██║ ╚═╝ ██║██║     ███████╗╚██████╔╝███████║
╚══════╝ ╚════╝ ╚══════╝╚═╝     ╚═╝╚═╝     ╚══════╝ ╚═════╝ ╚══════╝
*/                                                      

%Para probar los predicados implementados a continuación se presentan ejemplos, en forma de consultas con los predicados, 
%de manera de poder ingresarlos directamente a la consola de prolog y probarlos.

/*
- Ejemplos Predicado register:

1) Registrar al usuario israel al stack con contraseña qwerty:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2).

2) Registrar al usuario zeus al stack del ejemplo 1, con contraseña 123:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3).

3) Registrar al usuario patricio al stack del ejemplo 2, con contraseña abcd
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4).



- Ejemplos predicado login:
Tomando el stack resultante del punto 3 del predicado register:

1) El usuario israel se loguea:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5).

2) El usuario zeus se loguea:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"zeus","123",S5).

3) El usuario patricio se loguea:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"patricio","abcd",S5).



- Ejemplos predicado ask:
Para poder realizar una pregunta es necesario que el usuario se encuentre autenticado dentro del stack, por lo que se usaran los stacks resultante
del punto 1) de los ejemplos de login.

Cabe destacar que la fecha debe ser ingresada como una string con el siguiente formato "dia/mes/año", por ejemplo "22/11/2020".
Ademas las etiquetas deben ingresar como una lista de strings, por ejemplo ["etiqueta 1","etiqueta 2","etiqueta 3"].

1) El usuario israel hace una pregunta:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6).

2) El usuario zeus hace una pregunta:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8).

3) El usuario patricio hace una pregunta:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10).


- Ejemplos predicado answer:
Se retomara el stack como se dejo en el punto 3 del predicado ask y al igual que en ask,
la fecha debe ser ingresada como una string con el siguiente formato "dia/mes/año", por ejemplo "22/11/2020".
Ademas las etiquetas deben ingresar como una lista de strings, por ejemplo ["etiqueta 1","etiqueta 2","etiqueta 3"].

1) El usuario israel responde a la pregunta con id 2 de zeus:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12).

2) El usuario zeus responde a la pregunta con id 3 de patricio:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14).

3) El usuario patricio responde a la pregunta con id 1 de israel:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16).

4) El usuario zeus responde a la pregunta con id 1 de israel:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18).

- Ejemplos predicado accept:
Se retomara el stack como se dejo en el punto 4 de answer:

1) El usuario israel acepta la respuesta con id 4 en su pregunta con id 1:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20).

2) El usuario zeus acepta la respuesta con id 1 en su pregunta con id 2:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22).

3) El usuario patricio acepta la respuesta con id 2 en su pregunta con id 3:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22),
    stackLogin(S22,"patricio","abcd",S23),accept(S23,3,2,S24).

-Ejemplos predicado stackToString:
Se retomara el stack como se dejo en el punto 3 de accept:

1) Para crear una string que pueda ser visualizada luego de una manera mucho mas organizada del stack que se lleva hasta ahora:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22),
    stackLogin(S22,"patricio","abcd",S23),accept(S23,3,2,S24),
    stackToString(S24,StackStr).

2) Para poder imprimir por pantalla ese string y que se visualize de una forma ordenada se puede usar write, como en el siguiente ejemplo:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22),
    stackLogin(S22,"patricio","abcd",S23),accept(S23,3,2,S24),
    stackToString(S24,StackStr), write(StackStr).

3) En caso de que se use stackToString cuando hay un usuario logueado, solo mostrara las preguntas e informacion de ese usuario:
    Por ejemplo: si se usa stackToString cuando el usuario israel se encuentra logueado:

    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22),
    stackLogin(S22,"patricio","abcd",S23),accept(S23,3,2,S24),
    stackLogin(S24,"israel","qwerty",S25),
    stackToString(S25,StackStr).

4) Y mostrando la informacion ordenadamente por pantalla con write, solamente mostrara la informacion de ese usuario en especifico:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22),
    stackLogin(S22,"patricio","abcd",S23),accept(S23,3,2,S24),
    stackLogin(S24,"israel","qwerty",S25),
    stackToString(S25,StackStr),write(StackStr).


- Ejemplos predicado vote:
Se retomara el stack como se dejo en el punto 3 de accept:
un voto positivo se representa con un true.
un voto negativos se representa con un false.

1) El usuario zeus vota positivamente a la pregunta con id 1:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22),
    stackLogin(S22,"patricio","abcd",S23),accept(S23,3,2,S24),
    stackLogin(S24,"zeus","123",S25),
    getQuestion(S25,1,Pregunta),vote(S25,Pregunta,true,S26).

2) El usuario israel vota negativamente a la pregunta con id 3:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22),
    stackLogin(S22,"patricio","abcd",S23),accept(S23,3,2,S24),
    stackLogin(S24,"zeus","123",S25),
    getQuestion(S25,1,Pregunta),vote(S25,Pregunta,true,S26),
    stackLogin(S26,"israel","qwerty",S27),
    getQuestion(S27,3,Pregunta3),vote(S27,Pregunta3,false,S28).

3) El usuario zeus vota positivamente por la respuesta con id 1 de la pregunta con id 2:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22),
    stackLogin(S22,"patricio","abcd",S23),accept(S23,3,2,S24),
    stackLogin(S24,"zeus","123",S25),
    getQuestion(S25,1,Pregunta),vote(S25,Pregunta,true,S26),
    stackLogin(S26,"israel","qwerty",S27),
    getQuestion(S27,3,Pregunta3),vote(S27,Pregunta3,false,S28),
    stackLogin(S28,"zeus","123",S29),
    getAnswer(S29,2,1,Respuesta1),vote(S29,Respuesta1,true,S30).

4) El usuario israel vota negativamente por la respuesta con id 2 de la pregunta con id 3:
    crearStackVacio(Stack),stackRegister(Stack,"israel","qwerty",S2),stackRegister(S2,"zeus","123",S3),stackRegister(S3,"patricio","abcd",S4),
    stackLogin(S4,"israel","qwerty",S5),ask(S5,"03/12/2020","¿Como puedo hacer hola mundo en prolog?",["prolog"],S6),
    stackLogin(S6,"zeus","123",S7),ask(S7,"04/12/2020","¿Como defino una variable en C?",["C", "variables"],S8),
    stackLogin(S8,"patricio","abcd",S9),ask(S9,"05/12/2020","¿como puedo importar una libreria en C?",["C","Librerias"],S10),
    stackLogin(S10,"israel","qwerty",S11),answer(S11,"06/12/2020",2,"Puedes hacer int variable = 1, es importante definir el tipo de dato",["prolog","hola mundo"],S12),
    stackLogin(S12,"zeus","123",S13),answer(S13,"06/12/2020",3,"debes usar #include <nombre libreria> al principio de tu codigo",["C","librerias"],S14),
    stackLogin(S14,"patricio","abcd",S15),answer(S15,"06/12/2020",1,"en la consola de prolog has la consulta write(hola mundo)",["C","librerias"],S16),
    stackLogin(S16,"zeus","123",S17),answer(S17,"06/12/2020",1,"tambien puedes usar print o display en vez de write",["prolog","print"],S18),
    stackLogin(S18,"israel","qwerty",S19),accept(S19,1,4,S20),
    stackLogin(S20,"zeus","123",S21),accept(S21,2,1,S22),
    stackLogin(S22,"patricio","abcd",S23),accept(S23,3,2,S24),
    stackLogin(S24,"zeus","123",S25),
    getQuestion(S25,1,Pregunta),vote(S25,Pregunta,true,S26),
    stackLogin(S26,"israel","qwerty",S27),
    getQuestion(S27,3,Pregunta3),vote(S27,Pregunta3,false,S28),
    stackLogin(S28,"zeus","123",S29),
    getAnswer(S29,2,1,Respuesta1),vote(S29,Respuesta1,true,S30),
    stackLogin(S30,"israel","qwerty",S31),
    getAnswer(S31,3,2,Respuesta2),vote(S31,Respuesta2,false,S32).

*/  
