package perform.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;

public interface PerformAction {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
