package tn.iset.service;

import java.util.ArrayList;

import javax.ejb.Local;

import tn.iset.model.Enseig;

@Local
public interface GestionEnseigLocal {

	ArrayList<Enseig> getAll();

}
