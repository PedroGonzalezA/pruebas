package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Usuario;
import modelo.ModeloUsuario;

@WebServlet("/usuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String clave = request.getParameter("clave");

		ModeloUsuario modelo = new ModeloUsuario();
		Usuario usuario = modelo.iniciarSesion(nombre, clave);

		if (usuario == null) {
			request.setAttribute("mensaje", "Error nombre de usuario y/o clave");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			response.sendRedirect("principal.jsp");
		}
	}

}