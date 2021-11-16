% == Facts == 

% Man
man(rosemundo_guilherme_sudbrack).
man(alfred_simon).
man(rudi_sudbrack).
man(julio_cesar_casenave_ibarra).
man(sidney_castro).
man(fernando_alustiza_ibarra).
man(gabriel_slaviero_ibarra).
man(arthur_sudbrack_ibarra).
man(renato_bender_castro).
man(mathias_sudbrack_castro).

% Woman
woman(olivia_sudbrack).
woman(hertha_hoenck_simon).
woman(christa_elsa_elisabeth_simon_sudbrack).
woman(maria_jose_alustiza_ibarra).
woman(eva_bender_castro).
woman(cornelia_rosana_simon_sudbrack).
woman(carmen_susana_simon_sudbrack).
woman(ana_carolina_sudbrack_ibarra).

% Father
father(rosemundo_guilherme_sudbrack, rudi_sudbrack).
father(alfred_simon, christa_elsa_elisabeth_simon_sudbrack).
father(rudi_sudbrack, cornelia_rosana_simon_sudbrack).
father(rudi_sudbrack, carmen_susana_simon_sudbrack).
father(julio_cesar_casenave_ibarra, fernando_alustiza_ibarra).
father(sidney_castro, renato_bender_castro).
father(fernando_alustiza_ibarra, gabriel_slaviero_ibarra).
father(fernando_alustiza_ibarra, arthur_sudbrack_ibarra).
father(fernando_alustiza_ibarra, ana_carolina_sudbrack_ibarra).
father(renato_bender_castro, mathias_sudbrack_castro).

% No Father
father(nil, rosemundo_guilherme_sudbrack).
father(nil, alfred_simon).
father(nil, olivia_sudbrack).
father(nil, hertha_hoenck_simon).
father(nil, eva_bender_castro).
father(nil, julio_cesar_casenave_ibarra).
father(nil, maria_jose_alustiza_ibarra).
father(nil, sidney_castro).

% Mother
mother(olivia_sudbrack, rudi_sudbrack).
mother(hertha_hoenck_simon, christa_elsa_elisabeth_simon_sudbrack).
mother(christa_elsa_elisabeth_simon_sudbrack, cornelia_rosana_simon_sudbrack).
mother(christa_elsa_elisabeth_simon_sudbrack, carmen_susana_simon_sudbrack).
mother(maria_jose_alustiza_ibarra, fernando_alustiza_ibarra).
mother(eva_bender_castro, renato_bender_castro).
mother(cornelia_rosana_simon_sudbrack, arthur_sudbrack_ibarra).
mother(cornelia_rosana_simon_sudbrack, ana_carolina_sudbrack_ibarra).
mother(carmen_susana_simon_sudbrack, mathias_sudbrack_castro).

% No mother
mother(nil, rosemundo_guilherme_sudbrack).
mother(nil, alfred_simon).
mother(nil, olivia_sudbrack).
mother(nil, hertha_hoenck_simon).
mother(nil, eva_bender_castro).
mother(nil, julio_cesar_casenave_ibarra).
mother(nil, maria_jose_alustiza_ibarra).
mother(nil, sidney_castro).
mother(nil, gabriel_slaviero_ibarra).

% == Rules ==

% Parents
parents(Father, Mother, Child) :- father(Father, Child), mother(Mother, Child).

% Grandfather
grandfather(Grandfather, Grandchild) :- (father(Z, Grandchild) ; mother(Z, Grandchild)), father(Grandfather, Z).

% Grandmother
grandmother(Grandmother, Grandchild) :- (father(Z, Grandchild) ; mother(Z, Grandchild)), mother(Grandmother, Z).

% Full-brother
fullBrother(Person_1, Person_2) :- man(Person_1), parents(Father, Mother, Person_1), parents(Father, Mother, Person_2).
% Half-brother
halfBrother(Person_1, Person_2) :- man(Person_1), (parents(F1, M1, Person_1), parents(F2, M1, Person_2), F1 \= F2) ; (parents(F1, M1, Person_1), parents(F1, M2, Person_2), M1 \= M2).
% Brother
brother(Person_1, Person_2) :- fullBrother(Person_1, Person_2) ; halfBrother(Person_1, Person_2).

% Full-sister
fullSister(Person_1, Person_2) :- woman(Person_1), parents(Father, Mother, Person_1), parents(Father, Mother, Person_2).
% Half-sister
halfSister(Person_1, Person_2) :- woman(Person_1), (parents(F1, M1, Person_1), parents(F2, M1, Person_2), F1 \= F2) ; (parents(F1, M1, Person_1), parents(F1, M2, Person_2), M1 \= M2).
% Sister
brother(Person_1, Person_2) :- fullSister(Person_1, Person_2) ; halfSister(Person_1, Person_2).