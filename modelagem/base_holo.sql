#basic tables
INSERT INTO `holoagile`.`alerts` (`idsubscription`, `name`, `description`, `iduser`, `active`, `date_created`) VALUES ('1', 'teste', 'teste', '1', '1', '2019-01-01 01:01:01');
INSERT INTO `holoagile`.`terms` (`idterms`, `description`, `hash_description`, `address_transaction`, `date_created`) VALUES ('1', 'teste', 'tetestes', 'teste', '2019-01-01 01:01:01');
INSERT INTO `holoagile`.`role` (`idrole`, `name`, `description`, `date_created`) VALUES ('1', 'teste', 'teste', '2019-01-01 01:01:01');

#users
INSERT INTO `holoagile`.`user` (`iduser`, `password`, `name`, `email`, `email_confirmed`, `active`, `data_created`, `role_idrole`, `terms_idterms`) VALUES ('1', '123', 'teste', 'teste', '1', '1', '2019-01-01 01.01.01', 1,1);
INSERT INTO `holoagile`.`profile` (`idprofile`, `linkedin`, `picture`, `date_created`, `user_iduser`) VALUES ('1', '1', '1', '2019-01-01 01:01:01', '1');
INSERT INTO `holoagile`.`skill` (`idskill`, `skill`, `profile_idprofile`) VALUES ('1', '1', '1');
INSERT INTO `holoagile`.`wallet` (`idwallet`, `data_created`, `address`, `profile_idprofile`) VALUES ('1', '2019-01-01 01:01:01', 'abc', '1');

#projects
INSERT INTO `holoagile`.`product` (`idproject`, `name`, `wallet`, `trello`, `active`, `site`, `description`, `date_created`, `date_started`, `isEducation`, `isLabs`, `isSolutions`, `user_iduser`, `github`, `nda`, `public`, `details`) VALUES ('1', 'teste', 'teste1', 'teste', '1', 'teste', 'teste', '2019-01-01 01.01.01', '2019-01-01 01.01.01', '1', '1', '1', '1', 'teste', '0', '1', 'teste');
INSERT INTO `holoagile`.`colabs` (`idcolabs`, `project_idproject`, `user_iduser`, `date_created`, `status`) VALUES ('1', '1', '1', '2019-01-01 01.01.01', '1');
INSERT INTO `holoagile`.`documents` (`iddocuments`, `name`, `data_created`, `document_hash`, `address_file`, `product_idproject`) VALUES ('1', '1', '2019-01-01 01:01:01', 'abc', 'a', '1');
INSERT INTO `holoagile`.`points` (`idpoints`, `qtd`, `date_created`, `colabs_idcolabs`) VALUES ('1', '20', '2019-01-01', '1');


