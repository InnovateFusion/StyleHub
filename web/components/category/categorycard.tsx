import Image from "next/image";

interface CategoryCardProps {
  image: string;
  title: string;
  key: number;
}

export default function CategoryCard({ image, title }: CategoryCardProps) {
  return (
    <div className="w-32 h-32 rounded-2xl border-2 border-slate-100 flex-col justify-center items-center gap-2 inline-flex">
      <div className="w-16 h-16 p-2 bg-purple-50 rounded-full justify-center items-center gap-2.5 inline-flex">
        <div className="grow shrink basis-0 self-stretch justify-start items-start gap-2.5 flex">
          <Image
            className="grow shrink basis-0 self-stretch"
            src={image}
            alt={title}
            width={500}
            height={500}
          />
        </div>
      </div>
      <div className="text-zinc-900 text-base font-normal font-Roboto leading-normal tracking-wide">
        Accessories
      </div>
    </div>
  );
}
