% Tree knowledge base (Deciduos)
tree(deciduos, banyan).
tree(deciduos, black_ash).
tree(deciduos, white_ash).
tree(deciduos, neem).
tree(deciduos, bigtooth_aspen).
tree(deciduos, quaking_aspen).
tree(deciduos, mahogany_tree).
tree(deciduos, basswood).
tree(deciduos, american_beech).

% Tree knowledge base (Coniferous)
tree(coniferous, eucalyptus).
tree(coniferous, balsam_fir).
tree(coniferous, eastern_hemlock).
tree(coniferous, pitch_pine).
tree(coniferous, red_pine).
tree(coniferous, scots_pine).
tree(coniferous, eastern_red_cedar).
tree(coniferous, red_spruce).
tree(coniferous, white_spruce).

% Tree description Knowledge base (Deciduous)
description(banyan, [tropical_subtropical, tall_large_enormous, tall_large_enormous_canopy, fruit_syconium, leaves_enormous_thick_leatherlike]).
description(black_ash, [tall_medium, tall_medium_corky_texture, fruit_samara, leaves_pinnate_dark, leaves_brown_velvet]).
description(white_ash, [oval_shape, leaves_glaucous, leaves_grey_blue, leaves_compound]).
description(neem, [spreading_fastgrowing, drought_resistance]).
description(bigtooth_aspen, [thin_disorienting, leaves_strange, leaves_thick]).
description(quaking_aspen, [large, tall_thick_trunk, rough_bark, leaves_small_round, leaves_toothed]).
description(mahogany_tree, [tall_medium, leaves_small_round, leaves_brown_velvet, leaves_reddish_pink]).
description(basswood, [tall_pale_knotless]).
description(american_beech, [tall_ornamental]).

% Tree description Knowledge base (Coniferous)
description(eucalyptus, [bark_stringy_hard, fruit_gumnut, leaves_oil_glands]).
description(balsam_fir, [medium, softwood, bark_gray_brown, leaves_dark_brown]).
description(eastern_hemlock, [large, bark_gray_brown, shade_loving]).
description(pitch_pine, [medium, reddish_brown, leaves_needle_like]).
description(red_pine, [medium_large, bark_brown_red, leaves_needle_like]).
description(scots_pine, [medium_large, leaves_needle_like]).
description(eastern_red_cedar, [small, fragrant, drought_resistance, leaves_pointy]).
description(red_spruce, [small, shade_loving, leaves_needle_like]).
description(white_spruce, [large, tall_ornamental, fragrant, leaves_needle_like]).

% finding descriptive features within a list
member(X, [X|Tail]).
member(X, [H|T]) :-
    member(X,T).

% Get three attributes of the tree
get_tree(Description):-
    description(Name, Features), member(Feature, Features), Feature = Description,
    tree(Type, Name),
    format('The ~w ~w tree ~n', [Type, Name]).

% description(banyan, X), [Head|Tail] = X.

% ... first two elements and the rest
% description(banyan, X), [Head, Tail|Rest] = X.

