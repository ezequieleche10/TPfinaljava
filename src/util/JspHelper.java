package util;

public class JspHelper {
         
    public static String getHtml(String img, String pag, String titulo, String desc){
        StringBuilder HTML = new StringBuilder();
        HTML.append("<div class=\"row\"><div class=\"page type-page status-publish hentry work group portfolio-sticky portfolio-full-description\"><div class=\"work-thumbnail span3\"><div class=\"thumb-wrapper\"><div class=\"related_img\"><div class=\"picture_overlay\">")
            .append("<img width=\"573\" height=\"285\" src=\""+img+"\" class=\"attachment-section_portfolio\" alt=\"alt\" /><div class=\"overlay\"><div><p>")
            .append("<a href=\""+img+"\" rel=\"lightbox\" class=\"ch-info-lightbox\"><img src=\"images/icons/zoom.png\" alt=\"Open Lightbox\" /></a>")
            .append("<a href=\""+pag+"\"><img src=\"images/icons/project.png\" alt=\"\" /></a></p>")
            .append("<p class=\"title\">"+titulo+"</p><p class=\"subtitle\"></p>")
            .append("</div></div></div></div></div></div><div class=\"span8\"><div class=\"work-description\"> ")
            .append("<h2><a href=\""+pag+"\">"+titulo+"</a></h2><p>"+desc+"</p></div></div></div></div>");
            
            
        return HTML.toString();
    }
    
    public static String abrirHTML(){
        return "<div id=\"primary\" class=\"sidebar-no\"><div class=\"container group\"><div class=\"row\"><div id=\"content-home\" class=\"span12 content group\"><div class=\"page type-page status-publish hentry group\"><div class=\"section portfolio\">";
    }
    
    public static String cerrarHTML(){
        return "</div></div></div></div></div></div>";
        
    }
}
