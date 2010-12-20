package app.models;

@javax.persistence.Entity
public class Snippet extends Entity {
	
	private String home;
	private String tags;
	private String linguagem;
	private String codigo;
	
	public void setHome(String home) {
		this.home = home;
	}
	
	public String getHome() {
		return home;
	}
	
	public void setTags(String tags) {
		this.tags = tags;
	}
	
	public String getTags() {
		return tags;
	}
	
	public void setLinguagem(String linguagem) {
		this.linguagem = linguagem;
	}
	
	public String getLinguagem() {
		return linguagem;
	}
	
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	public String getCodigo() {
		return codigo;
	}
	
}
