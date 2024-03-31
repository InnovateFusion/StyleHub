import Product from "@/components/cards/Product";
import image from "../../../public/products/White Hoodle Cutout.png.png";
import FeatureChip from "./FeatureChip";

export default function  Features() {
  const featureChips = ["All", "Men", "Women", "Kids", "Accessories"];
  return (
    <div className="w-full p-5 md:px-[160px] flex flex-col py-8 md:py-[64px]  gap-y-large md:gap-y-x-large">
      <div className="w-full flex flex-col md:flex-row justify-between items-start md:items-center h-[80px] md:h-[120px]">
        <p className="prose-display-small-bold md:prose-display-medium-bold">
          {"FEATURED ITEMS".toUpperCase()}
        </p>
        <div>
          <div className="flex flex-row overflow-x-auto w-[340px] md:w-auto md:overflow-auto space-x-small md:space-x-medium">
            {featureChips.map((label, index) => (
              <>
                {index === featureChips.length - 1 ? (
                  <FeatureChip
                    key={index}
                    label={label}
                    isSelected={label === "All"}
                  />
                ) : (
                  <>
                    <FeatureChip
                      key={index}
                      label={label}
                      isSelected={label === "All"}
                    />
                    <p
                      key={index}
                      className="prose-title-large md:prose-headline-small text-onSurface "
                    >
                      {":"}
                    </p>
                  </>
                )}
              </>
            ))}
          </div>
        </div>
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
