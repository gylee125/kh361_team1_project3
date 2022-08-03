package com.mealkit.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

public class ProductDAO {

	private static ProductDAO productDAO = new ProductDAO();

	public static ProductDAO getInstance() {
		return productDAO;
	}

	private ProductDAO() {
	}

	private ProductVO makeProductDTOFromRS(ResultSet rs) throws SQLException {

		ProductVO productDTO = new ProductVO();

		productDTO.setpId(rs.getInt("pId"));
		productDTO.setTypeCode(rs.getString("typeCode"));
		productDTO.setpName(rs.getString("pName"));
		productDTO.setPrice(rs.getInt("price"));
		productDTO.setStock(rs.getInt("stock"));
		productDTO.setBrand(rs.getString("brand"));
		productDTO.setDescription(rs.getString("description"));
		productDTO.setThumbnail(rs.getString("thumbnail"));
		productDTO.setImage(rs.getString("image"));

		return productDTO;
	}

	private ProductDetailVO makeDetailDTOFromRS(ResultSet rs) throws SQLException {

		ProductDetailVO productDetailVO = new ProductDetailVO();

		productDetailVO.setpId(rs.getInt("pId"));
		productDetailVO.setTypeCode(rs.getString("typeCode"));
		productDetailVO.setpName(rs.getString("pName"));
		productDetailVO.setPrice(rs.getInt("price"));
		productDetailVO.setStock(rs.getInt("stock"));
		productDetailVO.setBrand(rs.getString("brand"));
		productDetailVO.setDescription(rs.getString("description"));
		productDetailVO.setThumbnail(rs.getString("thumbnail"));
		productDetailVO.setImage(rs.getString("image"));
		productDetailVO.settName(rs.getString("tName"));
		productDetailVO.settNameEng(rs.getString("tNameEng"));

		return productDetailVO;
	}
	
	public ProductDetailVO selectJoinByPId(Connection conn, int pId) throws SQLException {

        ResultSet rs = null;
        PreparedStatement pstmt = null;

        pstmt = conn.prepareStatement("SELECT * FROM product NATURAL JOIN productType WHERE pid=?");

        pstmt.setInt(1, pId);

        rs = pstmt.executeQuery();

        if (rs.next())
            return makeDetailDTOFromRS(rs);
        else
            return null;
    }

	public List<ProductVO> selectProductList(Connection conn) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement("SELECT * FROM product ORDER BY pId DESC");
		rs = pstmt.executeQuery();

		List<ProductVO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;
	}
	
	public List<ProductVO> select6ProductList(Connection conn) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM RNUM, PRODUCT.* FROM PRODUCT ORDER BY pId DESC) WHERE RNUM <= 6");
		rs = pstmt.executeQuery();

		List<ProductVO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;
	}

	public List<ProductVO> showRelatedList(Connection conn, int pId) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement(
				"SELECT * FROM (SELECT ROWNUM RNUM, PRODUCT.* FROM PRODUCT WHERE pId != ? ORDER BY pId DESC) WHERE RNUM <= 4 ");
		pstmt.setInt(1, pId);
		rs = pstmt.executeQuery();

		List<ProductVO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;
	}

	public ProductVO selectByPId(Connection conn, int pId) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement("select * from product where pId=?");

		pstmt.setInt(1, pId);

		rs = pstmt.executeQuery();

		if (rs.next())
			return makeProductDTOFromRS(rs);
		else
			return null;
	}

	public List<ProductVO> selectByTypeCode(Connection conn, String typeCode) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement("select * from product where typeCode=?");
		pstmt.setString(1, typeCode);
		rs = pstmt.executeQuery();

		List<ProductVO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;

	}

	public List<ProductVO> searchProduct(Connection conn, String keyword) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String getKeyword = "%" + keyword + "%";

		pstmt = conn.prepareStatement("SELECT * FROM product WHERE pName LIKE ?");
		pstmt.setString(1, getKeyword);
		rs = pstmt.executeQuery();

		List<ProductVO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;

	}

	public void insert(Connection conn, ProductVO product) throws SQLException {

		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement(
				"insert into product" + "(pId, typeCode, pName, price, stock, brand, description, thumbnail, image)"
						+ " values(pIdSeq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)");

		pstmt.setString(1, product.getTypeCode());
		pstmt.setString(2, product.getpName());
		pstmt.setInt(3, product.getPrice());
		pstmt.setInt(4, product.getStock());
		pstmt.setString(5, product.getBrand());
		pstmt.setString(6, product.getDescription());
		pstmt.setString(7, product.getThumbnail());
		pstmt.setString(8, product.getImage());

		pstmt.executeUpdate();
	}

	public int updatePName(Connection conn, int pId, String pName) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement("update product set pName = ? where pId = ?")) {
			pstmt.setString(1, pName);
			pstmt.setInt(2, pId);
			return pstmt.executeUpdate();
		}
	}

	public int updatePrice(Connection conn, int pId, int price) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement("update product set price = ? where pId = ?")) {
			pstmt.setInt(1, price);
			pstmt.setInt(2, pId);
			return pstmt.executeUpdate();
		}
	}

	public int delete(Connection conn, int pId) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement("delete from product where pId = ?")) {
			pstmt.setInt(1, pId);
			return pstmt.executeUpdate();
		}
	}

}
