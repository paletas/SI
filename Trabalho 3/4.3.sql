USE Escola
GO

CREATE VIEW CurrentUserData AS SELECT Numero, InfoPessoal.Nome, Disciplina, Responsavel, Nota FROM 
(SELECT * FROM Aluno WHERE Nome = CURRENT_USER) As InfoPessoal
INNER JOIN
(SELECT * FROM Disciplina INNER JOIN Inscricao ON Disciplina.Nome = Inscricao.Disciplina) AS Notas
ON InfoPessoal.Numero = Notas.Numero_Aluno

GO

GRANT Select ON CurrentUserData TO Aluno

REVOKE Select ON Aluno TO Aluno