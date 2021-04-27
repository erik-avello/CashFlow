package model;
public class MesDato {
    private String mes;
    private String campo;

    public MesDato(String mes, String campo) {
        this.mes = mes;
        this.campo = campo;
    }

    public MesDato() {
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getCampo() {
        return campo;
    }

    public void setCampo(String campo) {
        this.campo = campo;
    }
    
    
    
}
