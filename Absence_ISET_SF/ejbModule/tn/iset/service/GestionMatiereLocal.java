package tn.iset.service;

import java.util.List;

import javax.ejb.Local;

import tn.iset.model.Mat;

@Local
public interface GestionMatiereLocal {
List<Mat>getMatByEnseig(int idEns);
}
