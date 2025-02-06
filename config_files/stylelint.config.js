/** @type {import('stylelint').Config} */
export default {
	extends: ["stylelint-config-standard"],
	rules: {
		"import-notation": "string",
		"at-rule-empty-line-before": null,
		"declaration-empty-line-before": null,
		"no-descending-specificity": null,
		"selector-class-pattern": null,
		"media-feature-range-notation": "prefix",
	},
	reportDescriptionlessDisables: true,
	reportInvalidScopeDisables: true,
	reportNeedlessDisables: true,
};
