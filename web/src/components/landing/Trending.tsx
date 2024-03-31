import Product from "@/components/cards/Product";
import image from "../../../public/products/Elegant Beige Blazer For Women.png";

export default function Trending() {
  return (
    <div className="p-5 md:px-[160px] flex flex-col py-[64px] gap-y-x-large">
      <div className="flex flex-row justify-between md:h-[120px]">
        <p className="prose-display-small-bold md:prose-display-medium-bold">
          {"Trending".toUpperCase()}
        </p>
      </div>
      <div className="grid grid-rows-2 md:grid-cols-4 gap-x-large md:gap-x-x-large gap-y-large md:gap-y-x-large">
        <Product
          title="Elegant Beige Blazer For Women"
          price={23}
          image={image}
        />
        <Product
          title="Elegant Beige Blazer For Women"
          price={23}
          image={image}
        />
        <Product
          title="Elegant Beige Blazer For Women"
          price={23}
          image={image}
        />
        <Product
          title="Elegant Beige Blazer For Women"
          price={23}
          image={image}
        />
        <Product
          title="Elegant Beige Blazer For Women"
          price={23}
          image={image}
        />
        <Product
          title="Elegant Beige Blazer For Women"
          price={23}
          image={image}
        />
        <Product
          title="Elegant Beige Blazer For Women"
          price={23}
          image={image}
        />
        <Product
          title="Elegant Beige Blazer For Women"
          price={23}
          image={image}
        />
      </div>
    </div>
  );
}
