package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

import model.dto.ProductDTO;
import model.dto.ProductDetailDTO;

public class ProductDAO {

	private static ProductDAO productDAO = new ProductDAO();

	public static ProductDAO getInstance() {
		return productDAO;
	}

	private ProductDAO() {
	}

	private ProductDTO makeProductDTOFromRS(ResultSet rs) throws SQLException {

		ProductDTO productDTO = new ProductDTO();

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

	private ProductDetailDTO makeDetailDTOFromRS(ResultSet rs) throws SQLException {

		ProductDetailDTO productDetailDTO = new ProductDetailDTO();

		productDetailDTO.setpId(rs.getInt("pId"));
		productDetailDTO.setTypeCode(rs.getString("typeCode"));
		productDetailDTO.setpName(rs.getString("pName"));
		productDetailDTO.setPrice(rs.getInt("price"));
		productDetailDTO.setStock(rs.getInt("stock"));
		productDetailDTO.setBrand(rs.getString("brand"));
		productDetailDTO.setDescription(rs.getString("description"));
		productDetailDTO.setThumbnail(rs.getString("thumbnail"));
		productDetailDTO.setImage(rs.getString("image"));
		productDetailDTO.settName(rs.getString("tName"));
		productDetailDTO.settNameEng(rs.getString("tNameEng"));

		return productDetailDTO;
	}
	
	public ProductDetailDTO selectJoinByPId(Connection conn, int pId) throws SQLException {

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

	public List<ProductDTO> selectProductList(Connection conn) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement("SELECT * FROM product ORDER BY pId DESC");
		rs = pstmt.executeQuery();

		List<ProductDTO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;
	}
	
	public List<ProductDTO> select6ProductList(Connection conn) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement("SELECT * FROM (SELECT ROWNUM RNUM, PRODUCT.* FROM PRODUCT ORDER BY pId DESC) WHERE RNUM <= 6");
		rs = pstmt.executeQuery();

		List<ProductDTO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;
	}

	public List<ProductDTO> showRelatedList(Connection conn, int pId) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement(
				"SELECT * FROM (SELECT ROWNUM RNUM, PRODUCT.* FROM PRODUCT WHERE pId != ? ORDER BY pId DESC) WHERE RNUM <= 4 ");
		pstmt.setInt(1, pId);
		rs = pstmt.executeQuery();

		List<ProductDTO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;
	}

	public ProductDTO selectByPId(Connection conn, int pId) throws SQLException {

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

	public List<ProductDTO> selectByTypeCode(Connection conn, String typeCode) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		pstmt = conn.prepareStatement("select * from product where typeCode=?");
		pstmt.setString(1, typeCode);
		rs = pstmt.executeQuery();

		List<ProductDTO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;

	}

	public List<ProductDTO> searchProduct(Connection conn, String keyword) throws SQLException {

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String getKeyword = "%" + keyword + "%";

		pstmt = conn.prepareStatement("SELECT * FROM product WHERE pName LIKE ?");
		pstmt.setString(1, getKeyword);
		rs = pstmt.executeQuery();

		List<ProductDTO> list = new ArrayList<>();

		while (rs.next()) {
			list.add(makeProductDTOFromRS(rs));
		}
		return list;

	}

	public void insert(Connection conn, ProductDTO product) throws SQLException {

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
