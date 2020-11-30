import Vue from 'vue';
import VueI18n from 'vue-i18n';
import Cookies from 'js-cookie';
import elementKmLocale from 'element-ui/lib/locale/lang/km'; // element-ui lang
import elementEnLocale from 'element-ui/lib/locale/lang/en'; // element-ui lang
import kmLocale from './km';
import enLocale from './en';
Vue.use(VueI18n);

const messages = {
  km: {
    ...kmLocale,
    ...elementKmLocale,
  },
  en: {
    ...enLocale,
    ...elementEnLocale,
  },
};

export function getLanguage() {
  const chooseLanguage = Cookies.get('language');
  if (chooseLanguage) {
    return chooseLanguage;
  }

  // if has not choose language
  const language = (navigator.language || navigator.browserLanguage).toLowerCase();
  const locales = Object.keys(messages);
  for (const locale of locales) {
    if (language.indexOf(locale) > 0) {
      return locale;
    }
  }
  return 'en';
}
const i18n = new VueI18n({
  // set locale
  // options: en | vi | zh
  locale: getLanguage(),
  // set locale messages
  messages,
});

export default i18n;
