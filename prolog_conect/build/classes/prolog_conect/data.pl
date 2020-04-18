judul('SISTEM DIAGNOSA ANALISIS PENYAKIT JANTUNG').
pesan('jawab pertanyaan dengan y atau t').
pertanyaan('apakah dada terasa nyeri secara tiba-tiba?',nyeri).
pertanyaan('apakah terjadi sesak nafas',sesak_nafas).
pertanyaan('apakah kondisi cepat lelah dan lemas?',lemas).
pertanyaan('apakah kepala terasa pusing?',pusing).
pertanyaan('apakah terjadi pembengkakan di sekitar kaki dan sendi?',bengkak).
pertanyaan('apakah nafas pendek?',nafas_pendek).

rule(1,coroner):-
    observation(nyeri),
    observation(sesak_nafas),
    observation(lemas),
    observation(bengkak),
    not(observation(nafas_pendek)),
    observation(pusing).

rule(2,hipertensi):-
    not(observation(sesak_nafas)),
    not(observation(bengkak)),
    not(observation(nafas_pendek)),
    observation(nyeri),
    observation(lemas),
    observation(pusing).

rule(3,pericarditis):-
    not(observation(bengkak)),
    not(observation(pusing)),
    not(observation(nafas_pendek)),
    observation(nyeri),
    observation(sesak_nafas),
    observation(lemas).


rule(4,rematik):-
    not(observation(nyeri)),
    not(observation(bengkak)),
    not(observation(pusing)),
    not(observation(nafas_pendek)),
    observation(sesak_nafas),
    observation(lemas).

rule(5,otot_jatung):-
    not(observation(nyeri)),
    not(observation(nafas_pendek)),
    observation(sesak_nafas),
    observation(lemas),
    observation(bengkak),
    observation(pusing).

rule(6,gagal_jantung):-
    observation(nyeri),
    observation(nafas_pendek),
    observation(sesak_nafas),
    observation(lemas),
    observation(bengkak),
    observation(pusing).
jawaban(coroner, ' anda mengalami jantung koroner').
jawaban(hipertensi, ' anda mengalami hipertensi').
jawaban(pericarditis, ' anda mengalami pericarditis').
jawaban(rematik, ' anda mengalami rematik').
jawaban(otot_jatung, ' anda terserang penyakit otot jantung').
jawaban(gagal_jantung,' anda terserang penyakit gagal jantung').

tindakan(coroner,'tindakan: anda sebaiknya memeriksakan diri ke spesialis perawatan sesegera mungkin.
hindari makanan berkolesterol tinggi,berhenti merokok,menghindari
stress dan olahraga secara teratur').
tindakan(hipertensi,'tindakan:anda sebaiknya memeriksakan diri ke spesialis perawatan sesegera mungkin.
 hindari makanan yang mengandung kolesterol dan tigleserin').
tindakan(pericarditis,'tindakan:anda sebaiknya memeriksakan diri ke spesialis perawatan sesegera mungkin.
sebaiknya anda menerapkan pola hidup sehat,cukup istirahat dan olahraga').
tindakan(rematik,'tindakan:anda sebaiknya memeriksakan diri ke spesialis perawatan sesegera mungkin.
sebaiknya rajin membersihkan tempat tinggal,menghidari rokok,memakai masker di udara yang berdebu
dan berhati hati saat cuaca ekstrem').
tindakan(otot_jatung,'tindakan:anda sebaiknya memeriksakan diri ke spesialis perawatan sesegera mungkin.
hindari rokok dan makanan yang berkolesterol').
tindakan(gagal_jantung,'tindakan:anda sebaiknya memeriksakan diri ke spesialis perawatan sesegera mungkin.
sebaiknya konsumsi makanan sehat berhenti merokok dan minum alkohol').
