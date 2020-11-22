
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

