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
crearPregunta(Pregunta,Id,Autor,Fecha,Etiquetas,EstadoPregunta,Recompensa,VotosTotales,SalidaPregunta):-
    SalidaPregunta = [Pregunta, Id, Autor, Fecha, Etiquetas, EstadoPregunta, Recompensa, VotosTotales].

% Selectores

questionGetPregunta([Question,_,_,_,_,_,_,_], Question).

questionGetId([_,Id,_,_,_,_,_,_], Id).

questionGetUser([_,_,User,_,_,_,_,_], User).

questionGetDate([_,_,_,Date,_,_,_,_], Date).

questionGetLabels([_,_,_,_,Labels,_,_,_], Labels).

questionGetStatus([_,_,_,_,_,Status,_,_], Status).

questionGetRecompensa([_,_,_,_,_,_,Reward,_], Reward).

questionGetVotes([_,_,_,_,_,_,_,Votes], Votes).

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

userGetPassword([Username,_,_,_], Username).

userGetQuestions([_,_,Questions,_], Question).

userGetReputation([_,_,_,Reputacion], Reputacion).

/*
██████╗  █████╗ ███████╗███████╗    ██████╗ ███████╗    ██╗  ██╗███████╗ ██████╗██╗  ██╗ ██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝██╔════╝    ██╔══██╗██╔════╝    ██║  ██║██╔════╝██╔════╝██║  ██║██╔═══██╗██╔════╝
██████╔╝███████║███████╗█████╗      ██║  ██║█████╗      ███████║█████╗  ██║     ███████║██║   ██║███████╗
██╔══██╗██╔══██║╚════██║██╔══╝      ██║  ██║██╔══╝      ██╔══██║██╔══╝  ██║     ██╔══██║██║   ██║╚════██║
██████╔╝██║  ██║███████║███████╗    ██████╔╝███████╗    ██║  ██║███████╗╚██████╗██║  ██║╚██████╔╝███████║
╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
*/
