package br.com.marcos.covidSistema.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
//teste no github
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@Builder
@Data
@NoArgsConstructor
@Table(name = "exame")
public class ExameModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 14, nullable = false)
    private String protocolo;

    @Column(length = 60, nullable = false)
    private String nomepaciente;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date datanasc;

    @Column(length = 60)
    private String nomemae;

    @Column(length = 60)
    private String nomesocial;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date datatest;

    @Column(length = 30)
    private String munires;

    @Column(length = 30)
    private String municol;

    @Column(length = 30)
    private String localexame;

    @Column(length = 25)
    private String nomeprof;

    @Column(length = 5)
    private Integer numclasse;

    @Column(length = 6)
    private String classe;

    @Column(length = 20)
    private String grupo;

    @Column(length = 50)
    private String optradiosint;

    @Temporal(TemporalType.DATE)
    private Date datasint;

    @Column(length = 50)
    private String optradiores;

    @Column(length = 40)
    private String fabri;

    public void setNomepaciente(String nomepaciente) {
        if (nomepaciente.length() > 50 || nomepaciente.length() < 3)
            throw new IllegalArgumentException("O nome deve ter mais de 3 caracters e menos de 50");

        this.nomepaciente = nomepaciente;

    }

    public void setDatatest(String datatest) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date dataFormatada = format.parse(datatest);
        this.datatest = dataFormatada;

    }

    public void setDatanasc(String datanasc) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date dataFormatada = format.parse(datanasc);
        this.datanasc = dataFormatada;

    }

    public void setDatasint(String datasint) throws ParseException {
        if (datasint.isEmpty()) {
            this.datasint = null;
        } else {

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date dataFormatada = format.parse(datasint);
            this.datasint = dataFormatada;
        }

    }

}
