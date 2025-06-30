-- Insertion dans Categories
INSERT INTO Categories (name, icon_emoji, data_category_slug) VALUES
('État Civil & Identité', '🆔', 'identite'),
('Emploi & Formation', '💼', 'emploi'),
('Santé & Social', '🏥', 'social'),
('Impôts & Finances', '💰', 'impots');

-- Insertion dans Sites (quelques exemples)
-- Supposons que 'État Civil & Identité' a category_id = 1, 'Emploi & Formation' a category_id = 2, etc.
-- Vérifiez les IDs auto-incrémentés réels dans votre BDD.
INSERT INTO Sites (name, url, category_id, description) VALUES
('Service-Public.fr - Démarches officielles', 'https://www.service-public.fr', 1, 'Portail officiel pour les démarches administratives.'),
('ANTS - Passeport', 'https://passeport.ants.gouv.fr', 1, 'Demande et suivi de passeport.'),
('ANTS - Permis de conduire', 'https://permisdeconduire.ants.gouv.fr', 1, 'Démarches liées au permis de conduire.'),
('Pôle Emploi', 'https://www.pole-emploi.fr', 2, 'Recherche d''emploi et informations chômage.'),
('Mon Compte Formation', 'https://www.moncompteformation.gouv.fr', 2, 'Gestion de vos droits à la formation professionnelle.'),
('Ameli - Assurance Maladie', 'https://www.ameli.fr', 3, 'Site de l''Assurance Maladie.'),
('CAF - Allocations Familiales', 'https://www.caf.fr', 3, 'Site des Caisses d''Allocations Familiales.'),
('Impots.gouv.fr', 'https://www.impots.gouv.fr', 4, 'Portail de la Direction Générale des Finances Publiques.');

-- Insertion dans Keywords (quelques exemples)
INSERT INTO Keywords (keyword_text) VALUES
('démarche'), ('officiel'), ('administration'), ('formulaire'), ('état civil'),
('passeport'), ('voyage'), ('identité'), ('document'),
('permis'), ('conduire'), ('voiture'),
('emploi'), ('chômage'), ('travail'), ('formation'), ('allocation'),
('santé'), ('sécurité sociale'), ('remboursement'), ('médecin'), ('assurance maladie'),
('famille'), ('aide'), ('enfant'),
('impôt'), ('déclaration'), ('taxe'), ('revenu'), ('fisc');

-- Insertion dans SiteKeywords (liaison entre sites et mots-clés)
-- Supposons les site_id et keyword_id correspondants. Vous devrez les obtenir après insertion.
-- Exemple: Service-Public.fr (site_id=1) avec "démarche" (keyword_id=1), "officiel" (keyword_id=2)
-- ANTS - Passeport (site_id=2) avec "passeport" (keyword_id=6), "voyage" (keyword_id=7)
-- Pôle Emploi (site_id=4) avec "emploi" (keyword_id=13), "chômage" (keyword_id=14)

-- Pour obtenir les ID, vous pouvez faire des SELECT. Par exemple:
-- SELECT site_id FROM Sites WHERE name = 'Service-Public.fr - Démarches officielles'; (Résultat: 1)
-- SELECT keyword_id FROM Keywords WHERE keyword_text = 'démarche'; (Résultat: 1)

INSERT INTO SiteKeywords (site_id, keyword_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), -- Service-Public.fr
(2, 6), (2, 7), (2, 8), (2, 9),       -- ANTS - Passeport
(3, 9), (3, 10), (3, 11), (3, 12),     -- ANTS - Permis de conduire
(4, 13), (4, 14), (4, 15), (4, 16), (4, 17), -- Pôle Emploi
(6, 18), (6, 19), (6, 20), (6, 21), (6, 22), -- Ameli
(7, 17), (7, 23), (7, 24),             -- CAF (note: "allocation" est keyword_id=17)
(8, 25), (8, 26), (8, 27), (8, 28), (8, 29); -- Impots.gouv.fr

-- Insertion dans QuickLinks
INSERT INTO QuickLinks (name, url) VALUES
('Service Public', 'https://www.service-public.fr'),
('France.fr', 'https://www.france.fr'),
('Gouvernement', 'https://www.gouvernement.fr'),
('Open Data', 'https://www.data.gouv.fr'),
('Vie Publique', 'https://www.vie-publique.fr');