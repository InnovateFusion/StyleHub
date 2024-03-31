interface FeatureChipProps {
  label: string;
  isSelected: boolean;
}

export default function FeatureChip({ label, isSelected }: FeatureChipProps) {
  const color = isSelected ? "primary" : "onSurface";
  return (
    <p
      className={`prose-title-medium md:prose-headline-small text-${color} whitespace-nowrap`}
    >
      {label.toLocaleUpperCase()}
    </p>
  );
}
