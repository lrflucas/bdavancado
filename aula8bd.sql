-- Criar a tabela Usuario
CREATE TABLE Usuario (
    IDUsuario INT identity(1,1) PRIMARY KEY,
    NomeUsuario VARCHAR(50),
    ContagemPedidos INT
);

-- Criar a tabela Pedidos
CREATE TABLE PedidoUsuario (
    IDPedidoUsuario INT identity(1,1) PRIMARY KEY,
    IDUsuario INT FOREIGN KEY REFERENCES Usuario(IDUsuario),
    DataPedido DATE
);

-- Povoando a Tabela de Usuario
--SET IDENTITY_INSERT [Usuario] ON 
INSERT [Usuario] ([NomeUsuario],[ContagemPedidos]) VALUES (N'Maria Carla',0)
INSERT [Usuario] ([NomeUsuario],[ContagemPedidos]) VALUES (N'Pedro Lima',0)
INSERT [Usuario] ([NomeUsuario],[ContagemPedidos]) VALUES (N'Joao Carlos',0)
INSERT [Usuario] ([NomeUsuario],[ContagemPedidos]) VALUES (N'Adalberto Silva',0)
INSERT [Usuario] ([NomeUsuario],[ContagemPedidos]) VALUES (N'Emanuel Salerno',0)
INSERT [Usuario] ([NomeUsuario],[ContagemPedidos]) VALUES (N'Silvano Dantas',0)
--SET IDENTITY_INSERT [Usuario] OFF
GO

-- Povoando a Tabela de Pedidos
-- SET IDENTITY_INSERT [PedidoUsuario] ON 
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (1,CAST(N'2023-10-02' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (2,CAST(N'2023-10-03' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (3,CAST(N'2023-10-03' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (4,CAST(N'2023-10-04' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (1,CAST(N'2023-10-05' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (2,CAST(N'2023-10-05' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (3,CAST(N'2023-10-05' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (4,CAST(N'2023-10-06' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (1,CAST(N'2023-10-06' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (2,CAST(N'2023-10-07' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (3,CAST(N'2023-10-07' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (4,CAST(N'2023-10-07' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (1,CAST(N'2023-10-08' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (2,CAST(N'2023-10-08' AS Date))
-- SET IDENTITY_INSERT [PedidoUsuario] OFF
GO

select * from Usuario
select * from PedidoUsuario

-- Criar a trigger para atualizar a contagem de pedidos quando um novo pedido é inserido
CREATE TRIGGER trg_AfterInsertPedidoUsuario
ON PedidoUsuario
AFTER INSERT
AS
BEGIN
    UPDATE Usuario
    SET ContagemPedidos = ContagemPedidos + 1
    FROM Usuario u
    INNER JOIN inserted i ON u.IDUsuario = i.IDUsuario;
END;

-- Após ter criado a Trigger
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (1,CAST(N'2023-11-03' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (1,CAST(N'2023-11-04' AS Date))
INSERT [PedidoUsuario] ([IDUsuario],[DataPedido]) VALUES (1,CAST(N'2023-11-05' AS Date))

select * from Usuario
select * from PedidoUsuario

-- Criar a trigger para atualizar a contagem de pedidos quando um pedido é excluído

CREATE TRIGGER trg_AfterDeletePedido
ON PedidoUsuario
AFTER DELETE
AS
BEGIN
    UPDATE Usuario
    SET ContagemPedidos = ContagemPedidos - 1
    FROM Usuario u
    INNER JOIN deleted d ON u.IDUsuario = d.IDUsuario;
END;


DROP TRIGGER trg_AfterInsertPedidoUsuario;

DROP TRIGGER trg_AfterDeletePedido;
