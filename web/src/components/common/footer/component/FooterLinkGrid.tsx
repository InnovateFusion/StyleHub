import FooterLink from "./FooterLink";

function FooterLinkGrid() {
  const array = [
    ["About", "How It Works", "Featured", "Partnership", "Business Relations"],
    ["Community", "Events", "Blog", "Podcast", "Teams"],
    ["Social", "Discord", "Instagram", "Twitter", "Facebook"],
  ];

  return (
    <div className="flex flex-row gap-x-10 md:gap-x-v-large justify-start items-start">
      {array.map((item, index) => {
        return (
          <div key={index} className="flex flex-col gap-y-small prose-body-large">
            {item.map((subItem, subIndex) => {
              return (
                <FooterLink
                  key={subIndex}
                  name={subItem}
                  isHeading={subIndex === 0}
                />
              );
            })}
          </div>
        );
      })}
    </div>
  );
}

export default FooterLinkGrid;
