inisialisasi:-
    write('**SINYO MARCELLINO/180535632564**'),nl,
    consult('data.pl'),
    judul(Judul),write(Judul),nl,nl,
    write_pesan,nl.

write_pesan:-
    pesan(Pesan),
    write(Pesan),nl,fail.
write_pesan:- nl.

check(Jawab):- Jawab = y,main,nl,nl.
check(Jawab):- Jawab = t,fail.

pengamatan:-
    pertanyaan(Tanya, Observasi),
    write(Tanya),
    read(Jawaban),
    Jawaban =y,
    assert(observation(Observasi)),
    fail.
pengamatan.
delete:- retractall(observation(_)).
go:-

        write("Anda ingin mengulang lagi (y/t)?"),
		read(Jawab),nl,
        delete,
		check(Jawab).

main:-
    inisialisasi,
    write('masukan Nama : '),read(Nama),
    write('masukan Umur : '),read(Umur),
    pengamatan, nl,
    rule(X, Y),
    jawaban(Y, Z),
    tindakan(Y, A),nl,
    write('pasien dengan nama '),write(Nama),
    write(' yang berumur '),write(Umur),
    write(Z),nl,
    write(A),nl,nl,
    go,
    delete.
main:-
   write('Gangguan kesehatan tersebut disebabkan oleh kebiasaan buruk anda. Lakukan olahraga teratur dan tidur secukupnya'),nl,nl,
   delete.

pl_config_dylib :-
    current_prolog_flag(apple, true),
    !,
    jpl_config_dylib(['libjvm.dylib', 'libjsig.dylib', 'libjawt.dylib']).
jpl_config_dylib :-
    print_message(warning, jpl_config(apple_only)).

jpl_config_dylib(Libs) :-
    java_home(JavaHome),
    debug(dylib(jpl), 'Java home at ~p', [JavaHome]),
    dylib_jpl(Dylib),
    debug(dylib(jpl), 'JPL at ~p', [Dylib]),
    dylib_dependencies(Dylib, Dependencies),
    maplist(update_dylib(JavaHome, Dylib, Dependencies), Libs).
