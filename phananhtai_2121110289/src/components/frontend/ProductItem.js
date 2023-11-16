import { Link } from "react-router-dom";
import { urlImage } from "../../config";
import { useEffect } from "react";
import { useState } from "react";
import { FaCartPlus } from 'react-icons/fa';
function ProductItem(props) {
    const [cart, setCart] = useState([]);

  useEffect(() => {
    const cartData = localStorage.getItem('cart');
    if (cartData) {
      setCart(JSON.parse(cartData));
    }
  }, []);

  const addToCart = () => {
    const productCopy = { ...props.product };
    const updatedCart = [...cart, productCopy];
    setCart(updatedCart);
    localStorage.setItem('cart', JSON.stringify(updatedCart));
    alert("Đã thêm vào giỏ hàng!")
  };
    return (
        <div className="col-md-3 mb-3" >
            <div className="product-item border">
                <div className="product-image">
                    <Link to={'/chi-tiet-san-pham/' + props.product.slug}>
                        <img src={urlImage + 'product/' + props.product.image} className="img-fluid" alt="san pham" />
                    </Link>
                </div>  
                <div className="product-name p-2">
                    <Link style={{textDecorationLine:"none"}}to={'/chi-tiet-san-pham/' + props.product.slug}>
                        <h3 className="text-center fs-6 ">{props.product.name}</h3>
                    </Link>
                </div>
                <div className="product-pice p-2">
                    <div className="row">
                        <div className="col-7">
                            <strong className="text-danger fs-5">{props.product.pricesale}<sup>đ</sup></strong>
                        </div>
                        <div className="col-5 text-end">
                            <del className="text fs-6">{props.product.price}</del><sup>đ</sup>
                        </div>
                        </div>
                </div>
                <div className="text-center">
                <button onClick={addToCart}className="btn btn-sm btn-outline-success me-1 " >
                    <FaCartPlus className="text-center " style={{ width:100,height:30}} />
                </button>
                </div>
            </div>

        </div>
    );
}
export default ProductItem;