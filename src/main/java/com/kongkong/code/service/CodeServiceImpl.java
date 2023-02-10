package com.kongkong.code.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.kongkong.code.dao.ICodeDao;
import com.kongkong.code.vo.CodeVO;
import com.kongkong.util.MybatisSqlSessionFactory;

@Service
public class CodeServiceImpl implements ICodeService{
	
//	private static CodeServiceImpl instance = new CodeServiceImpl();
//	
//	private CodeServiceImpl(){
//	}
//	
//	public static CodeServiceImpl getInstance() {
//		if(instance == null) instance = new CodeServiceImpl();
//		return instance;
//	}
	
	private Logger logger = LoggerFactory.getLogger(getClass());
//	private SqlSessionFactory factory = MybatisSqlSessionFactory.getSqlSessionFactory();	
	
//	private ICodeDao codeDao = new CodeDaoOracle();
//	private String JDBC_URL = "jdbc:apache:commons:dbcp:study";
	
	@Autowired
	private ICodeDao codeDao;
	
	@Override
	public List<CodeVO> getCodeListByParent(String parentCode) {
		logger.debug("parentCode={}" , parentCode);
//		try(SqlSession session = factory.openSession()) {
//			List<CodeVO> list = session.selectList("com.study.code.dao.ICodeDao.getCodeListByParent", parentCode);
//			ICodeDao codeDao = session.getMapper(ICodeDao.class);
			List<CodeVO> result = codeDao.getCodeListByParent(parentCode);
			return result;
		} 
//	}
	
}
