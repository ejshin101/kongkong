package com.kongkong.code.service;

import java.util.List;

import com.kongkong.code.vo.CodeVO;

public interface ICodeService {
	
	/**
	 * <b>공통코드에 조회목록을 리턴한다.</b>
	 *  
	 * @param parentCode
	 * @return 코드목록 List<CodeVO>
	 */
	public List<CodeVO> getCodeListByParent(String parentCode) ;
	
}
