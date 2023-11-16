
import { useEffect, useState } from "react";
import { FaInstagram, FaYoutube, FaFacebook, FaTwitter } from "react-icons/fa";
import { Link } from "react-router-dom";
import menuservice from "../../services/MenuService";

function Footer() {
	const [menus, setMenus] = useState([]);
	useEffect(function () {
		(async function () {
			await menuservice.getByParentId('footermenu', 1).then(function (result) {
				setMenus(result.data.menus);
			});
		})();
	}, [])
	const [menus1, setMenus1] = useState([]);
	useEffect(function () {
		(async function () {
			await menuservice.getByParentId('footermenu', 0).then(function (result) {
				setMenus1(result.data.menus);
			});
		})();
	}, [])
	return (
		<section className="footer" style={{ backgroundColor: "#031b36" }}>
			<div className="container">
				<div className="row">
					<div className="col-xs-4 col-md-4 col-lg-3 text-light my-3 ">
						<h4 className="title-menu text-warning">
							THÔNG TIN CHUNG
						</h4>
						<div className="des_foo">
							Với sứ mệnh "Khách hàng là ưu tiên số 1" chúng tôi luôn mạng lại giá trị tốt nhất
						</div>
						<div className="list-menu toggle-mn list-info">
							<div className="content-contact clearfix">
								<span className="list_footer">
									<b>Địa chỉ: </b>
									103 Phường Tăng Nhơn Phú B, Quận 9, TP. Hồ Chí Minh
								</span>
							</div>
							<div className="content-contact clearfix">
								<span className="list_footer">
									<b>Điện thoại: </b>
									<Link style={{ color: "#1d9f9c", textDecorationLine: "none" }} title="1900 6750" to="tel:19006750">
										0397 901 748
									</Link>
								</span>
							</div>
							<div className="content-contact clearfix">
								<span className="list_footer">
									<b>Email: </b>
									<Link style={{ color: "#1d9f9c", textDecorationLine: "none" }} title="support@sapo.vn" to="mailto:beansport@gmail.com">
										watchstore@gmail.com
									</Link>
								</span>
							</div>
						</div>
					</div>
					<div className="col-xs-4 col-md-2 col-lg-2 footer-click text-light my-3 ">

						<h4 className="title-menu clicked text-warning">
							VỀ CHÚNG TÔI
						</h4>
						<ul className="list-menu toggle-mn hidden-mob text-light ">
							
						{menus1.map(function (menu, index) {
								return (<li className="nav-item ">
									<Link className="nav-link text-white" style={{ paddingTop: 10 }} to={menu.link}>{menu.name}</Link>
								</li>)

							})}
							{/* <li className="li_menu py-1" >
								<Link to="/" title="Trang chủ" style={{ color: "white", textDecorationLine: "none" }} >Trang chủ</Link>
							</li>

							<li className="li_menu py-1">
								<Link to="/gioi-thieu" title="Giới thiệu" style={{ color: "white", textDecorationLine: "none" }}>Giới thiệu</Link>
							</li>

							<li className="li_menu py-1">
								<Link to="/san-pham" title="Sản phẩm" style={{ color: "white", textDecorationLine: "none" }}>Sản phẩm</Link>
							</li>
							<li className="li_menu py-1">
								<Link to="/lien-he" title="Liên hệ" style={{ color: "white", textDecorationLine: "none" }}>Liên hệ</Link>
							</li> */}
						</ul>
					</div>
					<div className="col-xs-4 col-md-2 col-lg-4 footer-click text-light my-3">
						<h4 className="title-menu clicked text-warning">
							CHÍNH SÁCH KHÁCH HÀNG
						</h4>
						<ul className="list-menu toggle-mn hidden-mob">
						{menus.map(function (menu, index) {
								return (<li className="nav-item ">
									<Link className="nav-link text-white" style={{ paddingTop: 10 }} to={menu.link}>{menu.name}</Link>
								</li>)

							})}
							{/* <li className="li_menu py-1">
								<Link to="/chinh-sach-mua-hang" title="Chính sách thành viên" style={{ color: "white", textDecorationLine: "none" }}>Chính sách mua hàng</Link>
							</li>

							<li className="li_menu py-1">
								<Link to="/chinh-sach-bao-hanh" title="Chính sách thanh toán" style={{ color: "white", textDecorationLine: "none" }}>Chính sách bảo hành</Link>
							</li>

							<li className="li_menu py-1">
								<Link to="/chinh-sach-van-chuyen" title="Hướng dẫn mua hàng" style={{ color: "white", textDecorationLine: "none" }}>Chính sách vận chuyển</Link>
							</li>

							<li className="li_menu py-1">
								<Link to="/chinh-sach-doi-tra" title="Chính sách đổi sản phẩm" style={{ color: "white", textDecorationLine: "none" }}>Chính sách đổi trả</Link>
							</li> */}


						</ul>
					</div>
					<div className="col-xs-4 col-md-5 col-lg-3 footer-click text-light my-3">
						<h4 className="title-menu clicked text-warning">
							LIÊN KẾT XÃ HỘI
						</h4>
						<ul className="list-menu toggle-mn hidden-mob ">
							<Link className="me-3" to="https://www.facebook.com/watchstore.vn" style={{ textDecorationLine: "none", color: "white" }}><FaFacebook /></Link>
							<Link className="me-3" to="" style={{ textDecorationLine: "none", color: "white" }}><FaTwitter /></Link>
							<Link className="me-3" to="https://www.youtube.com/@watchstore.official" style={{ textDecorationLine: "none", color: "white" }}><FaYoutube /></Link>
							<Link className="me-3" to="https://www.instagram.com/watchstorevn/" style={{ textDecorationLine: "none", color: "white" }}><FaInstagram /></Link>
						</ul>
						<Link to="http://online.gov.vn/Home/WebDetails/75019?AspxAutoDetectCookieSupport=1"><img className="" style={{width:200,paddingRight:20}}src="https://webmedia.com.vn/images/2021/09/logo-da-thong-bao-bo-cong-thuong-mau-xanh.png"/></Link>
					</div>

				</div>

			</div>
		</section>
	);
}
export default Footer;