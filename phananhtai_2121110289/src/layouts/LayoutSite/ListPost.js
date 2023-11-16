import { Link } from "react-router-dom";
import { useState } from "react";
import { useEffect } from "react";
import topicservice from "../../services/TopicService";
function ListPost() {
    const [listTopic, setTopic] = useState([]);
    useEffect(function () {
        (async function () {
            try {
                const result = await topicservice.gettAll();
                setTopic(result.data.data);
            } catch (error) {
                console.error(error);
            }
        })();
    }, [])
    return (
        <div className="listpost mb-5">
            <h3 className=" p-3 m-0 text-center fs-5" style={{ backgroundColor: "#031b36", color: "white", width: 397 }}>CHỦ ĐỀ BÀI VIẾT</h3>
            <ul>
                {listTopic.map(function (topic, index) {
                    return (

                        <li style={{ listStyle: "none" }} key={index} className="my-4">
                            <Link className='m-3' style={{ textDecorationLine: "none" }} to={'/chu-de-bai-viet/' + topic.slug}>{topic.name}</Link>
                        </li>);
                })}
            </ul>
        </div>
    );
}

export default ListPost;
