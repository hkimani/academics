% Declaring the plant types
plants(non_flowering).
plants(flowering).
plants(spore_bearing).

% Expansion (Non-flowering)
plant_type(non_flowering, spore_bearing, no_roots, mosses).
plant_type(non_flowering, spore_bearing, with_roots, ferns).

% Expansion (Flowering)
plant_type(flowering, gymnosperms, naked_seeds, no_desc).
plant_type(flowering, angiosperms, seed_leaf_1, monocots).
plant_type(flowering, angiosperms, seed_leaves_2, dicots).

% Get plant type as terminal node
get_plant_type(Description):-
    plants(Description),
    plant_type(Description, X, Y, Z), 
    format('The ~w ~w tree ~n', [Description, Z]).


% Cosine and Tangents
loop(0).
loop(N) :- N>0, write('Cosine : '), X is cos(N), write(X), write(', '), write('Tangent : '), Y is tan(N), write(Y), nl, M is N-1, loop(M). 

% Covid

% Patient description
patient(ill, week2).
patient(old, lung_disease, asthma, cancer, heart_failure, cerebrovascular, renal, liver, diabetes, immunocompromisation, obesity).

% Symptoms
symptoms(trouble_breathing, persistent_pain, chest_pressure, confusion, narcolepsy, bluish_lips, bluish_face).

% Diagnose
tell_doctor(IsIll, Week, Age, Condition, Symptom) :- 
    patient(IsIll, Week),
    patient(Age),
    patient(Condition),
    symptoms(Symptom),
    write('Admit immediately, requires attention!!').
