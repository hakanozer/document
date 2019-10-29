package com.calisma.ajaxusing;

import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GirisController {
	
	static Kullanici kl = null;

	@RequestMapping(value = "/giris", method = RequestMethod.GET)
	public String giris() {
		return "giris";
	}
	
	@ResponseBody
	@RequestMapping(value = "/girisYap", method = RequestMethod.POST)
	public String girisYap(Kullanici kl) {
		try {
			String q = "select *from kullanici where mail = '"+kl.getMail()+"' and sifre = '"+kl.getSifre()+"'";
			ResultSet rs = new DB().baglan().executeQuery(q);
			if(rs.next()) {
				kl.setId(rs.getString("id"));
				kl.setAdi(rs.getString("adi"));
				kl.setSoyadi(rs.getString("soyadi"));
				GirisController.kl = kl;
				return "basarili";
			}else {
				return "hatali";
			}
		} catch (Exception e) {
			System.err.println("Giriþ Hatasý : " + e);
		}
		
		return "hatali";
	}
	
	
	@RequestMapping(value = "/profil", method = RequestMethod.GET)
	public String profil(Model model) {
		try {
			List<Kullanici> ls = new ArrayList<Kullanici>();
			ResultSet rs = new DB().baglan().executeQuery("select * from kullanici");
			while(rs.next()) {
				Kullanici kl = new Kullanici();
				kl.setId(rs.getString("id"));
				kl.setAdi(rs.getString("adi"));
				kl.setSoyadi(rs.getString("soyadi"));
				kl.setMail(rs.getString("mail"));
				kl.setSifre(rs.getString("sifre"));
				ls.add(kl);
			}
			model.addAttribute("ls", ls);
		} catch (Exception e) {
			System.err.println("Kullanýcý Getirme Hatasý : " + e);
		}
		
		
		return "profil";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/kayitYap", method = RequestMethod.POST)
	public String kayitYap(Kullanici kl) {
		try {
			String q = "insert into kullanici values(null, '"+kl.getAdi()+"', '"+kl.getSoyadi()+"', '"+kl.getMail()+"', '"+kl.getSifre()+"')";
			int yaz = new DB().baglan().executeUpdate(q);
			if(yaz > 0) {
				String ekle = "<tr>\r\n" + 
						"                <td>1</td>\r\n" + 
						"                <td>"+kl.getAdi()+"</td>\r\n" + 
						"                <td>"+kl.getSoyadi()+"</td>\r\n" + 
						"                <td>"+kl.getMail()+"</td>\r\n" + 
						"                <td>"+kl.getSifre()+"</td>\r\n" + 
						"              </tr>";
				return ekle;
			}else {
				return "basarisiz";
			}
		} catch (Exception e) {
			System.err.println("Ekleme Hatasý : " + e);
		}
		return "hatali";
	}
	

}
