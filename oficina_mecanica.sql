                                            --===============================================
                                            --PROJETO L�GICO BANCO DE DADOS OFICINA MEC�NICA
                                            --================================================
                                            
                                            
                                                            --================
                                                            --Criando DB
                                                            --================
create database oficina_mecanica;
use oficina_mecanica;


                                                            --================
                                                            --Criando Tabelas
                                                            --================

--================
--Clientes
--================
create table clientes (
		id_cliente int primary key auto_increment,
        nome_cliente varchar (30),
        CPF char(11) unique,
        modelo_do_veiculo varchar (30),
        Placa_do_veiculo char(7) unique,
        contato_cliete int );
 
--================
--equipe
--================       
create table equipe_de_mecanicos (
		id_mecaninco int primary key auto_increment,
        nome_mecanico varchar (30),
        endereço varchar (30),
        especialidade_mecanica enum('Funilaria','Eletrica','Arrefecimento','Motor','Cambio')
);

--================
--OS
--================
create table ordem_de_servico (
		id_os int primary key auto_increment,
        data_os date,
        status_os enum('analisando','em andamento','aguardando aprovação','aguardando peça','concluido'),
        data_conclusao date,
        valor float,
        tipo_os enum ('concerto','revisão'),
        Descricao_serviço varchar (255),
        idCliente_os int,
        idMecanico_os int,
        constraint fk_ordem_de_servico_cliente foreign key (idCliente_os) references clientes(id_cliente),
        constraint fk_ordem_de_servico_mecanico foreign key (idMecanico_os) references equipe_de_mecanicos(id_mecaninco)        
);

--================
--M�o de Obra
--================
create table mao_de_obra(
		id_mao_de_obra int primary key auto_increment,
        valor_mao_de_obra float,
        idMecanico_resposavel int,
        idOrcamento_mao_de_obra int,
        constraint fk_mao_de_obra_mecanico foreign key (idMecanico_resposavel) references equipe_de_mecanicos(id_mecaninco),
        constraint fk_mao_de_obra_orcamento foreign key (idOrcamento_mao_de_obra) references orcamento(Id_orcamento)
);

--================
--Or�amento
--================
create table orcamento(
		Id_orcamento int primary key auto_increment,
        Numero_os int,
        valor_orcamento float,
        id_cliente_orcamento int,
        constraint fk_orcamento_Numero_os foreign key (Numero_os) references ordem_de_servico(id_os),
		constraint fk_orcamento_id_cliente foreign key (id_cliente_orcamento) references clientes(id_cliente)
);

--================
--Pe�as
--================
create table peca(
		id_peca int primary key auto_increment,
        descricao_peca varchar (255),
        valor_peca float,
        idOrcamento_peca int,
        constraint fk_peca_idOrcamento_peca foreign key (idOrcamento_peca) references orcamento(Id_orcamento)
);

                                                            --==================
                                                            --Persistindo dados
                                                            --==================


insert into clientes (nome_cliente, CPF, modelo_do_veiculo, Placa_do_veiculo,contato_cliete) values
						('Ronny Nascimento', '44222334785','etios','FLF5j33','960813116'),
                        ('Karina Arruda', '38822334785','corsa','ALF5G44','960813469'),

insert into equipe_de_mecanicos (nome_mecanico,endereço,especialidade_mecanica) values
								('Marcio Ribeiro', 'Rua francisco 82','Funilaria'),
                                ('Jose Santos', 'Rua Ribas 63', 'Motor'),
                                ('Elivaldo Sintra','Rua Barão silva 22', 'Eletrica');
                                


insert into ordem_de_servico (data_os, status_os,data_conclusao,valor,tipo_os,Descricao_serviço,idCliente_os,idMecanico_os) values
							 ('2022-08-30', 'analisando','2022-09-05','200','concerto','funilaria na porta','1','1'),


insert into mao_de_obra (valor_mao_de_obra,idMecanico_resposavel,idOrcamento_mao_de_obra) values
						('150','1','1'),
                        ('200','2','2'),
                        ('230','3','3');
 

insert into orcamento (Numero_os ,valor_orcamento, id_cliente_orcamento)values
						('1','200',1),
                        ('2','500',2),
                        ('3','500',3);


insert into peca (descricao_peca,valor_peca,idOrcamento_peca) values
					('espelho lateral direito','50',1),
                    ('cabeçote do motor','300','2'),
                    ('farol esquerdo','270','3');
 
