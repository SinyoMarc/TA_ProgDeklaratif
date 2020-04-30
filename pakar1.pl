:- use_module(library(jpl)).
periksa :-
		write('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'),nl,
		write('***********  Kelompok 180535632564_533_507_586_534  *************'),nl,
		write('*************  Sistem Diagnosa Penyakit Jantung  ****************'),nl,
		write('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'),nl,nl,nl,
		interface2.



    pertanyaan(Observasi,nyeri) :- check(Observasi," dada terasa nyeri secara tiba-tiba? (y|t)").

    pertanyaan(Observasi,sesak_nafas) :- check(Observasi," terjadi sesak nafas? (y|t)").

    pertanyaan(Observasi,lemas) :- check(Observasi," kondisi cepat lelah dan lemas? (y|t)").

    pertanyaan(Observasi,pusing) :- check(Observasi," kepala terasa pusing? (y|t)").

    pertanyaan(Observasi,bengkak) :- check(Observasi," terjadi pembengkakan di sekitar kaki dan sendi? (y|t)").

    pertanyaan(Observasi,nafas_pendek) :- check(Observasi," nafas pendek? (y|t)").



    rule(Observasi,coroner) :-
        pertanyaan(Observasi,nyeri),
        pertanyaan(Observasi,sesak_nafas),
        pertanyaan(Observasi,lemas),
		pertanyaan(Observasi,bengkak),
		pertanyaan(Observasi,pusing).

    rule(Observasi,hipertensi) :-
        pertanyaan(Observasi,nyeri),
        pertanyaan(Observasi,lemas),
        pertanyaan(Observasi,pusing).

    rule(Observasi,pericarditis) :-
        pertanyaan(Observasi,nyeri),
        pertanyaan(Observasi,lemas),
		pertanyaan(Observasi,sesak_nafas).
        
    rule(Observasi,rematik) :-
        pertanyaan(Observasi,lemas),
		pertanyaan(Observasi,sesak_nafas).

    rule(Observasi,otot_jatung) :-
        pertanyaan(Observasi,sesak_nafas),
        pertanyaan(Observasi,lemas),
		pertanyaan(Observasi,bengkak),
		pertanyaan(Observasi,pusing).

    rule(Observasi,gagal_jantung) :-
        pertanyaan(Observasi,nyeri),
		pertanyaan(Observasi,sesak_nafas),
		pertanyaan(Observasi,nafas_pendek),
        pertanyaan(Observasi,lemas),
		pertanyaan(Observasi,bengkak),
		pertanyaan(Observasi,pusing).


	rule(_,"Anda Mungkin Memiliki Penyakit yang disebabkan kurangnya Olahraga, saran lebih lanjut Anda dapat periksa ke dokter").

    response(Reply) :-
        read(Reply),
        write(Reply),nl.

ask(Observasi,Question) :-
	write(Observasi),write(', Apakah '),write(Question),

	interface(', Apakah ',Observasi,Question),
	write('Loading.'),nl,
	sleep(0.4),
	write('Loading..'),nl,
	sleep(0.2),
	nl.

:- dynamic yes/1,no/1.

check(P,S) :-
   (yes(S) ->  true ;
    (no(S)  ->   fail ;
     ask(P,S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


pt(Observasi):-

		rule(Observasi,Disease),
		interface3(Observasi,', Anda Kemungkinan Mengalami ',Disease,'.'),
        write(Observasi),write(','),write(Disease),write('.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),

		write('~~~~~~~~~~~~~~~~~Periksakan Kesehatan Anda Selalu~~~~~~~~~~~~~'),nl,
		sleep(0.4),
		write('~~dr.Sinyo Marcellino,Sp.F.,Sp.JP. selalu siap melayani anda~~'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Diagnosa Penyakit'], F),
	jpl_new('javax.swing.JLabel',['Spesialis Jantung dan Pembuluh Darah'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [250,50], _),
	jpl_call(F, setSize, [600,400], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _),
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
	   assert(no(Z)), fail
	   ).

interface2 :-
	jpl_new('javax.swing.JFrame', ['Diagnosa Penyakit'], F),
	jpl_new('javax.swing.JLabel',['Spesialis Jantung dan Pembuluh Darah'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [250,50], _),
	jpl_call(F, setSize, [600,400], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Input Your Name'], N),
	jpl_call(F, dispose, [], _),
	(	N == @(null)
		->	write('Terimakasih atas kunjungannya'),interface3('Apakah',' Anda',' yakin',' ^Logout |->^'),end,fail;	
		write("Hi. Bagaimana keadaanya sekarang? Pertama masukkan nama : "),write(N),nl,pt(N)
	).


interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Sistem Diagnosa'], F),
	jpl_new('javax.swing.JLabel',['dr. Sinyo Marcellino,Sp.F.,Sp.JP. '],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [250,50], _),
	jpl_call(F, setSize, [600,400], _),	
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _),
	(	N == @(void)
		->	write('')
		;	write("")
	).

help :- write("Itu memulai Program, Ketikkan 'periksa' pada compile").