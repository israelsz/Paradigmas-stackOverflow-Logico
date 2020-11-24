/*

███████╗████████╗ █████╗  ██████╗██╗  ██╗    ████████╗██████╗  █████╗ 
██╔════╝╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝    ╚══██╔══╝██╔══██╗██╔══██╗
███████╗   ██║   ███████║██║     █████╔╝        ██║   ██║  ██║███████║
╚════██║   ██║   ██╔══██║██║     ██╔═██╗        ██║   ██║  ██║██╔══██║
███████║   ██║   ██║  ██║╚██████╗██║  ██╗       ██║   ██████╔╝██║  ██║
╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝       ╚═╝   ╚═════╝ ╚═╝  ╚═╝
 
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

%Selectores

questionGetPregunta([Question,_,_,_,_,_,_,_], Question).

questionGetId([_,Id,_,_,_,_,_,_], Id).

questionGetUser([_,_,User,_,_,_,_,_], User).

questionGetDate([_,_,_,Date,_,_,_,_], Date).

questionGetLabels([_,_,_,_,Labels,_,_,_], Labels).

questionGetStatus([_,_,_,_,_,Status,_,_], Status).

questionGetRecompensa([_,_,_,_,_,_,Reward,_], Reward).

questionGetVotes([_,_,_,_,_,_,_,Votes], Votes).

/*
██████╗  █████╗ ███████╗███████╗    ██████╗ ███████╗    ██╗  ██╗███████╗ ██████╗██╗  ██╗ ██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝██╔════╝    ██╔══██╗██╔════╝    ██║  ██║██╔════╝██╔════╝██║  ██║██╔═══██╗██╔════╝
██████╔╝███████║███████╗█████╗      ██║  ██║█████╗      ███████║█████╗  ██║     ███████║██║   ██║███████╗
██╔══██╗██╔══██║╚════██║██╔══╝      ██║  ██║██╔══╝      ██╔══██║██╔══╝  ██║     ██╔══██║██║   ██║╚════██║
██████╔╝██║  ██║███████║███████╗    ██████╔╝███████╗    ██║  ██║███████╗╚██████╗██║  ██║╚██████╔╝███████║
╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝    ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
*/
