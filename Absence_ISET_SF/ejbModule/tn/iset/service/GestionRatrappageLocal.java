package tn.iset.service;

import java.util.Date;

import javax.ejb.Local;

import tn.iset.model.Ratrappage;

@Local
public interface GestionRatrappageLocal {
Ratrappage save(Ratrappage ratrappage);

Ratrappage findById(int idRat);

Ratrappage findByDateAbsNotRatrapped(Date laDateAbs, int numEnsig);

void update(Ratrappage ratrappage);
}
