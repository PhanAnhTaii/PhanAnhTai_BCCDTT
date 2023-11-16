import Slideshow from "./Slideshow";
import Post from "./Post";
import { useEffect } from "react";
import { useState } from "react";
import categoryservice from "../../../services/CategoryService";
import topicservice from "../../../services/TopicService";
import ProductHome from "./ProductHome";
import productservice from "../../../services/ProductService";
import ProductSale from "../Product/ProductSale";
import ProductBest from "../Product/ProductBest";
import ProductNew from "../Product/ProductNew";
function Home() {
    const [categorys, setCategorys] = useState([]);
    useEffect(function () {
        (async function () {
            await categoryservice.getCatparentId(0).then(function (result) {
                setCategorys(result.data.categorys);
            });
        })();
    }, []);

    const [topics, setTopics] = useState([]);
    useEffect(function () {
        (async function () {
            await topicservice.getTopicId(0).then(function (result){
                setTopics(result.data.topics);
                });
        })();
    }, []);
    return (
        <section className="maincontent">
                <Slideshow/>
                {categorys.map(function(category,index){
                    return <ProductHome key={index} category={category}/>
                })}
                <ProductNew/>
               <ProductSale/>
               <ProductBest/>
               
                {topics.map(function(topic,index){
                    return <Post key={index} topic={topic}/>
                })}
        </section>
    );
}
export default Home;