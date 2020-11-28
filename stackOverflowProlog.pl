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

%Constructor

crearStackVacio([[], [], [], []]).

crearStack(TDApreguntas,TDArespuestas,TDAusuarios,UsuarioActivo,StackSalida):-
    StackSalida = [TDApreguntas,TDArespuestas,TDAusuarios,UsuarioActivo].

%Selectores
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

% Constructor
crearPregunta(Pregunta,Id,Autor,Fecha,Etiquetas,EstadoPregunta, VotosTotales,SalidaPregunta):-
    SalidaPregunta = [Pregunta, Id, Autor, Fecha, Etiquetas, EstadoPregunta, VotosTotales].

% Selectores

questionGetPregunta([Question,_,_,_,_,_,_], Question).

questionGetId([_,Id,_,_,_,_,_], Id).

questionGetUser([_,_,User,_,_,_,_], User).

questionGetDate([_,_,_,Date,_,_,_], Date).

questionGetLabels([_,_,_,_,Labels,_,_], Labels).

questionGetStatus([_,_,_,_,_,Status,_], Status).

questionGetVotes([_,_,_,_,_,_,Votes], Votes).

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


/*
████████╗██████╗  █████╗     ██╗   ██╗███████╗██╗   ██╗ █████╗ ██████╗ ██╗ ██████╗ ███████╗
╚══██╔══╝██╔══██╗██╔══██╗    ██║   ██║██╔════╝██║   ██║██╔══██╗██╔══██╗██║██╔═══██╗██╔════╝
   ██║   ██║  ██║███████║    ██║   ██║███████╗██║   ██║███████║██████╔╝██║██║   ██║███████╗
   ██║   ██║  ██║██╔══██║    ██║   ██║╚════██║██║   ██║██╔══██║██╔══██╗██║██║   ██║╚════██║
   ██║   ██████╔╝██║  ██║    ╚██████╔╝███████║╚██████╔╝██║  ██║██║  ██║██║╚██████╔╝███████║
   ╚═╝   ╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚══════╝
*/

% Representacion
% (string X string X(list entero)X entero)
% [usuario password [preguntas] reputacion]

% Constructor

crearUsuario(Username,Password,Preguntas,Reputacion,SalidaUsuario):-
    SalidaUsuario = [Username,Password,Preguntas,Reputacion].

% Selectores

userGetUsername([Username,_,_,_], Username).

userGetPassword([_,Password,_,_], Password).

userGetQuestions([_,_,Questions,_], Questions).

userGetReputation([_,_,_,Reputacion], Reputacion).

% Modificadores

%Agrega una pregunta al usuario
userAddQuestion(TDAusuario,IdPregunta,Lista):-
    userGetUsername(TDAusuario,Username),
    userGetPassword(TDAusuario,Password),
    userGetReputation(TDAusuario,Reputacion),
    userGetQuestions(TDAusuario,PreguntasUsuario),
    append(PreguntasUsuario,[IdPregunta],NuevaListaPreguntas),
    Lista = [Username,Password,NuevaListaPreguntas,Reputacion].

/*
██████╗  █████╗ ███████╗███████╗    ██████╗ ███████╗    ██╗  ██╗███████╗ ██████╗██╗  ██╗ ██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝██╔════╝    ██╔══██╗██╔════╝    ██║  ██║██╔════╝██╔════╝██║  ██║██╔═══██╗██╔════╝
██████╔╝███████║███████╗█████╗      ██║  ██║█████╗      ███████║█████╗  ██║     ███████║██║   ██║███████╗
██╔══██╗██╔══██║╚════██║██╔══╝      ██║  ██║██╔══╝      ██╔══██║██╔══╝  ██║     ██╔══██║██║   ██║╚════██║
██████╔╝██║  ██║███████║███████╗    ██████╔╝███████╗    ██║  ██║███████╗╚██████╗██║  ██║╚██████╔╝███████║
╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
*/

%Usuarios: israel, pedro, maria, juan

%Al menos 2 stack's, 4 usuarios registrados, 5 preguntas y 10 respuestas
                 %Preguntas
stack1([[["Hola ¿como puedo hacer hola mundo en python?", 1, "israel", "22/11/2020", ["python"], "abierta", 0, 0],
        ["En C ¿como puedo asignar memoria a un arreglo?", 2, "pedro", "23/11/2020", ["C", "memoria"], "abierta", 0, 0],
        ["Hola soy nuevo, como se encuentran hoy ?", 3, "juan", "23/11/2020", ["comunidad"], "abierta", 0, 0],
        ["Hola como puedo instalar una libreria en python?", 4, "maria", "24/11/2020", ["python", "libreria"], "abierta", 0, 0],
        ["¿Prefieren el helado de chocolate o de frutilla?", 5, "juan", "24/11/2020", ["postre", "helado"], "abierta", 0, 0]],
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

stack2([]).

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

/*
███████╗██╗   ██╗███╗   ██╗ ██████╗██╗ ██████╗ ███╗   ██╗███████╗███████╗    
██╔════╝██║   ██║████╗  ██║██╔════╝██║██╔═══██╗████╗  ██║██╔════╝██╔════╝    
█████╗  ██║   ██║██╔██╗ ██║██║     ██║██║   ██║██╔██╗ ██║█████╗  ███████╗    
██╔══╝  ██║   ██║██║╚██╗██║██║     ██║██║   ██║██║╚██╗██║██╔══╝  ╚════██║    
██║     ╚██████╔╝██║ ╚████║╚██████╗██║╚██████╔╝██║ ╚████║███████╗███████║    
╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝    
                                                                             
██████╗ ███████╗ ██████╗ ██╗   ██╗███████╗██████╗ ██╗██████╗  █████╗ ███████╗
██╔══██╗██╔════╝██╔═══██╗██║   ██║██╔════╝██╔══██╗██║██╔══██╗██╔══██╗██╔════╝
██████╔╝█████╗  ██║   ██║██║   ██║█████╗  ██████╔╝██║██║  ██║███████║███████╗
██╔══██╗██╔══╝  ██║▄▄ ██║██║   ██║██╔══╝  ██╔══██╗██║██║  ██║██╔══██║╚════██║
██║  ██║███████╗╚██████╔╝╚██████╔╝███████╗██║  ██║██║██████╔╝██║  ██║███████║
╚═╝  ╚═╝╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝
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

stackRegister2(Stack,Username,Password,Stack2):-
    string(Username),
    string(Password),
    stack1(Stack),
    stackGetQuestions(Stack, Preguntas),
    stackGetAnswers(Stack, Respuestas),
    stackGetUsers(Stack, Usuarios),
    not(buscarElemento(Usuarios,Username)),!,
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

ask(Stack,Fecha,TextoPregunta,Etiquetas,Stack2):-
    string(Fecha),
    string(TextoPregunta),
    is_list(Etiquetas),
    %Se consiguen las sub listas del Stack
    stackGetQuestions(Stack,Preguntas),
    stackGetAnswers(Stack,Respuestas),
    stackGetUsers(Stack,Usuarios),
    stackGetActiveUser(Stack, ActiveUser),
    %Se verifica si hay un usuario conectado
    length(ActiveUser,CantidadUsuariosConectados),
    not(CantidadUsuariosConectados = 0),
    %Se crea el id de pregunta
    length(Preguntas,CantidadPreguntas),
    Id is CantidadPreguntas+1,
    %Se consigue al autor de la pregunta, que es el usuario Conectado
    nombreUsuarioActivo(ActiveUser,Autor),
    crearPregunta(TextoPregunta,Id,Autor,Fecha,Etiquetas,"abierta",0,SalidaPregunta),
    %Se agrega la pregunta a las preguntas ya disponibles del stack
    append(Preguntas,[SalidaPregunta],ListaPreguntasResultante),
    %Se agrega el id de la pregunta al usuario que la hizo
    buscarListaUsuario(Usuarios,Autor,ListaUsuario),
    userAddQuestion(ListaUsuario,Id,ListaIdInsertado),
    reemplazar(ListaUsuario,Usuarios,ListaIdInsertado,ListaUsuariosResultante),
    %Finalmente se crea el stack
    crearStack(ListaPreguntasResultante,Respuestas,ListaUsuariosResultante,[],Stack2).