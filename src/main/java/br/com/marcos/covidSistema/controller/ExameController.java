
package br.com.marcos.covidSistema.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.marcos.covidSistema.model.ExameModel;
import br.com.marcos.covidSistema.repository.ExameRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@RequiredArgsConstructor
public class ExameController {

    private final ExameRepository exameRepository;

    @GetMapping("/cadastro")
    public String formulariocad() {
        return "cad-exame";
    }

    @GetMapping("/listar")
    public String listar(Model memoria) {
        memoria.addAttribute("listaExames", exameRepository.findByOrderByIdDesc());
        return "lista-exame";
    }

    @GetMapping("/excluir")
    public String excluir(@RequestParam Long id) {
        exameRepository.deleteById(id);
        return "redirect:/listar";
    }

    @PostMapping("/salvar")
    public String create(ExameModel exame, BindingResult result) {

        if (result.hasErrors()) {
            result.getFieldErrors().forEach(erro -> log.info(erro.getField() + " - " + erro.getDefaultMessage()));
            return "redirect:/cadastro";
        } else {

            SimpleDateFormat f = new SimpleDateFormat("ddMMyyyyHHmmss");
            Date teste = new Date();
            exame.setProtocolo(f.format(teste));
            exameRepository.save(exame);
            return "redirect:/cadastro";
        }
    }

    @GetMapping("/prepareEditar")
    public String preparaEditar(@RequestParam Long id, Model memoria) {
        var exame = exameRepository.findById(id).get();

        String data1 = String.valueOf(exame.getDatanasc());
        String data2 = String.valueOf(exame.getDatatest());

        String data3 = String.valueOf(exame.getDatasint());
        memoria.addAttribute("datanascimento", data1);
        memoria.addAttribute("datateste", data2);
        memoria.addAttribute("datasintoma", data3);
        memoria.addAttribute("exameAtual", exame);

        memoria.addAttribute("alterar", true);

        return "/cadastro";
    }

    @PostMapping("/editar")
    public String editar(ExameModel exameNovo) throws ParseException {
        var exame = exameRepository.findById(exameNovo.getId()).get();

        exame.setNomepaciente(exameNovo.getNomepaciente());
        exame.setDatanasc(dataToString(exameNovo.getDatanasc()));
        exame.setDatasint(dataToString(exameNovo.getDatasint()));
        exame.setDatatest(dataToString(exameNovo.getDatatest()));

        exameRepository.saveAndFlush(exame);

        return "redirect:/listar";
    }

    public String dataToString(Date data){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(data); 
    }
}