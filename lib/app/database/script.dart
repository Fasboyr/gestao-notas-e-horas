

const String createTableSubject = '''
CREATE TABLE subject(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(200) NOT NULL,
  nota1 REAL NOT NULL,
  nota2 REAL NOT NULL,
  nota3 REAL NOT NULL,
  media REAL NOT NULL,
  url_avatar VARCHAR(300) NOT NULL
)
''';

const String insertSubject1 = '''
INSERT INTO subject (nome, nota1, nota2, nota3, media, url_avatar)
VALUES ('Português', 8.0, 7.2, 5.0, 9.5, 'https://media.istockphoto.com/id/1198222830/pt/vetorial/open-textbook-drawing.jpg?s=2048x2048&w=is&k=20&c=Ej3_neMpr5mfF6kAzBvy3S92x5zI4Ypdum-nRqh-1W0=')
''';

const String insertSubject2 = '''
INSERT INTO subject (nome, nota1, nota2, nota3, media, url_avatar)
VALUES ('Matemática', 9.0, 6.2, 7.0, 7.6, 'https://cdn.pixabay.com/photo/2017/01/30/14/20/time-2020934_1280.png')
''';

const String insertSubject3 = '''
INSERT INTO subject (nome, nota1, nota2, nota3, media, url_avatar)
VALUES ('Química', 6.0, 7.8, 8.0, 7.2, 'https://cdn.pixabay.com/photo/2017/01/31/00/14/bubble-2022490_1280.png')
''';



/*final lista = [
    {'nome': 'Português', 'nota1' : '8','nota2' : '7.2','nota3' : '5.0', 'media' : '6,7', 'avatar': 'https://media.istockphoto.com/id/1198222830/pt/vetorial/open-textbook-drawing.jpg?s=2048x2048&w=is&k=20&c=Ej3_neMpr5mfF6kAzBvy3S92x5zI4Ypdum-nRqh-1W0='}, 
    {'nome': 'Matemática', 'nota1' : '9','nota2' : '6.2','nota3' : '7.0', 'media' : '7,4', 'avatar': 'https://cdn.pixabay.com/photo/2017/01/30/14/20/time-2020934_1280.png'}, 
    {'nome': 'Química', 'nota1' : '6','nota2' : '7.8','nota3' : '8.0', 'media' : '7,2', 'avatar': 'https://cdn.pixabay.com/photo/2017/01/31/00/14/bubble-2022490_1280.png'}, 
  ];*/ 

const createTableHours = '''
  CREATE TABLE hours(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(200) NOT NULL,
    hora_necessario INT NOT NULL,
    hora_registrada DOUBLE NOT NULL,
    url_avatar VARCHAR(300) NOT NULL 
  )
''';

const insertHour1 = '''
INSERT INTO hours (nome, hora_necessario, hora_registrada, url_avatar)
VALUES ('Grupo 1 - Ensino', 155, 0, 'https://cdn.pixabay.com/photo/2022/08/09/21/11/back-to-school-7375827_1280.png')
''';

const insertHour2 = '''
INSERT INTO hours (nome, hora_necessario, hora_registrada, url_avatar)
VALUES ('Grupo 2 - Extensão', 40, 0, 'https://cdn.pixabay.com/photo/2017/09/28/22/43/database-search-2797375_1280.png')
''';

const insertHour3 = '''
INSERT INTO hours (nome, hora_necessario, hora_registrada, url_avatar)
VALUES ('Grupo 3 - Social', 40, 0, 'https://cdn.pixabay.com/photo/2016/03/31/19/15/social-service-1294853_1280.png')
''';




const createTableCertificate = '''
  CREATE TABLE certificate(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(200) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    hora_certificada DOUBLE NOT NULL,
    grupo VARCHAR(25) NOT NULL,
    url_avatar VARCHAR(300) NOT NULL 
  )
''';

const insertCertificate1 = '''
INSERT INTO certificate (nome, descricao, hora_certificada, grupo, url_avatar)
VALUES ('Certificado 1', 'Descrição 1', 10, 'Grupo 1 - Ensino', '')
''';

const insertCertificate2 = '''
INSERT INTO certificate (nome, descricao, hora_certificada, grupo, url_avatar)
VALUES ('Certificado 2', 'Descrição 2', 5, 'Grupo 2 - Extensão', '')
''';

const insertCertificate3 = '''
INSERT INTO certificate (nome, descricao, hora_certificada, grupo, url_avatar)
VALUES ('Certificado 3', 'Descrição 3', 8, 'Grupo 3 - Social', '')
''';


/*
 final lista = [
    {
      'nome': 'Certificado 1',
      'descricao': 'Descrição 1',
      'hora_certificada': '10',
      'avatar':
          '',
      'grupo': 'Grupo 1 - Ensino'
    },
    {
      'nome': 'Certificado 2',
      'descricao': 'Descrição 2',
      'hora_certificada': '5',
      'avatar':
          '',
      'grupo': 'Grupo 2 - Extensão'
    },
    {
      'nome': 'Certificado 3',
      'descricao': 'Descrição 3',
      'hora_certificada': '8',
      'avatar':
          '',
      'grupo': 'Grupo 3 - Social'
    },
  ];

  */