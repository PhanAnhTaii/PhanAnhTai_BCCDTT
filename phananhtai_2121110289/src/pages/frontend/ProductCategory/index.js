import { useEffect } from "react";
import { useState } from "react";
import productservice from "../../../services/ProductService";
import ProductItem from "../../../components/frontend/ProductItem";
import { useParams } from "react-router-dom";
import categoryservice from "../../../services/CategoryService";
import ListCategory from "../../../layouts/LayoutSite/ListCategory";
import ListBrand from "../../../layouts/LayoutSite/ListBrand";

function ProductCategory() {
    const { slug } = useParams();
    const [limit, setLimit] = useState(8);
    const [title, setTitle] = useState("")
    const [products, setProducts] = useState([]);
    useEffect(function () {
        (async function () {
            try {
                const infocategory = await categoryservice.getBySlug(slug);
                const catid = infocategory.data.data.id;
                setTitle(infocategory.data.data.name);
                const infoproduct = await productservice.getProductByCategoryId(catid, limit);
                setProducts(infoproduct.data.products);
            } catch (error) {
                console.error(error);
            }
        })();
    }, [limit, slug]);
    return (
        <section className="maincontent">
            <div className="container-my-4">
                <div className="row">
                    <div className="col-md-3 p-0 my-5 ">
                        <ListCategory />
                        <ListBrand />
                    </div>

                    <div className="col-md-9">
                        <h3 className="text-center text-danger my-4">{title}</h3>
                        <div className="row">
                            {products.map(function (product, index) {
                                return <ProductItem product={product} key={index} />
                            })}
                        </div>

                        <div className='row'>
                            <div className='col-12 text-center my-2'>
                                <button className="btn btn-success" onClick={() => setLimit(limit + 4)}>Xem thêm</button>
                            </div></div>
                    </div>
                </div>
            </div >
        </section>
    );
}

export default ProductCategory;