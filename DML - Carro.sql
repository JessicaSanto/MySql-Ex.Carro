USE CarrosBD;

INSERT INTO carros VALUES (
'1',
'Fiat',
'Marea',
'1999',
'15450.00',
'Vermelho',
'50000'
)

INSERT INTO carros VALUES (
'2',
'Fiat',
'Uno',
'1985',
'12500.00',
'Verde',
'100000'
)


INSERT INTO carros VALUES (
'3',
'Ford',
'Escort',
'1978',
'13240.00',
'Azul',
'500000'
)


INSERT INTO carros VALUES (
'4',
'Chevrolet',
'Chevette',
'1980',
'14650.00',
'Preto',
'6500000'
)

INSERT INTO Teste VALUES (
'5',
'Fiat',
'Palip',
'2014',
'37650.00',
'Preto',
'620000'
)

INSERT INTO carros VALUES (
'6',
'Chevrolet',
'Meriva',
'2009',
'35650.00',
'Prata',
'240000'
)

INSERT INTO Carros VALUES (
'7',
'Ford',
'EcoSport',
'2020',
'75000.00',
'Preto',
'490000'
)

INSERT INTO carros VALUES (
'8',
'Fiat',
'Mobi',
'2022',
'70000.00',
'Vermelho',
'480000'
)


INSERT INTO carros VALUES (
'9',
'Renault',
'Kwid',
'2023',
'72000.00',
'Verde',
'350000'
)

INSERT INTO carros VALUES (
'10',
'Toyota',
'Etios',
'2021',
'69000.00',
'Prata',
'480000'
)

INSERT INTO carros VALUES (
'11',
'Fiat',
'Mobi',
'2024',
'80000.00',
'Preto',
'5000'
)

INSERT INTO proprietario VALUES (
'1',
'Jessica',
'1'
)

INSERT INTO proprietario VALUES (
'2',
'Carol',
'3'
)

INSERT INTO proprietario VALUES (
'3',
'Caique',
'1'
)


UPDATE carros SET valor = 170000 where marca = "Chevrolet"