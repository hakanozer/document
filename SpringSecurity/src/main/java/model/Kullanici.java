package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the kullanici database table.
 * 
 */
@Entity
@NamedQuery(name="Kullanici.findAll", query="SELECT k FROM Kullanici k")
public class Kullanici implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int kid;

	private String mail;

	private String name;

	private String pass;

	private String surname;

	public Kullanici() {
	}

	public int getKid() {
		return this.kid;
	}

	public void setKid(int kid) {
		this.kid = kid;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getSurname() {
		return this.surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

}