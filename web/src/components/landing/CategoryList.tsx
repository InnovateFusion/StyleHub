import image from "../../../public/products/Elegant Beige Blazer For Women.png";
import Category from "../cards/Category";

export default function CategoryList() {
  const datas = [
    {
      title: "Apparel",
      image: image,
    },
    {
      title: "Footwear",
      image: image,
    },
    {
      title: "Accessories",
      image: image,
    },
    {
      title: "Sportswear",
      image: image,
    },
    {
      title: "Formalwear",
      image: image,
    },
    {
      title: "Apparel",
      image: image,
    },
    {
      title: "Footwear",
      image: image,
    },
    {
      title: "Accessories",
      image: image,
    },
    {
      title: "Sportswear",
      image: image,
    },
    {
      title: "Formalwear",
      image: image,
    },
  ];
  return (
    <div className="w-full flex flex-col gap-y-large md:gap-y-x-large px-5 md:px-[160px] pt-v-large md:pt-vv-large pb-large md:pb-v-large">
      <p className="prose-display-small-bold md:prose-display-medium-bold">
        {"CATEGORY".toUpperCase()}
      </p>
      <div className="flex flex-row whitespace-nowrap overflow-x-auto w-[320px] md:w-full md:grid md:grid-row-2 md:grid-cols-5 gap-10">
        {datas.map((data, index) => (
          <Category
            key={index}
            title={data.title}
            image={data.image}
          />
        ))}
      </div>
    </div>
  );
}
