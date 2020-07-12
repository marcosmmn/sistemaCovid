package br.com.marcos.covidSistema.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.marcos.covidSistema.model.ExameModel;

public interface ExameRepository extends JpaRepository<ExameModel,Long> {

    List<ExameModel> findByOrderByIdDesc();

    
}