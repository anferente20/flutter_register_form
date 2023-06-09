class TextValidator {
  bool isAddressValid(String? value) {
    if (value == null) return false;
    if (value.length < 5) return false;
    const String pattern =
        r'^(Autopista|Avenida|Avenida Calle|Avenida Carrera|Avenida|Carrera|Calle|Carrera|Circunvalar|Diagonal|Kilometro|Transversal|autopista|avenida calle|Avenida calle|Avenida carrera|avenida carrera|avenida|calle|carrera|circunvalar|diagonal|kilometro|transversal|AUTOP|AV|AC|AK|CL|Cll|CLL|KR|CCV|DG|KM|TV)(\s)?([a-zA-Z]{0,15}|[0-9]{1,3})(\s)?[a-zA-Z]?(\s)?(bis)?(\s)?(Este|Norte|Occidente|Oeste|Sur|este|norte|occidente|oeste|sur)?(\s)?(#(\s)?[0-9]{1,2}(\s)?[a-zA-Z]?(\s)?(bis)?(\s)?(Este|Norte|Occidente|Oeste|Sur|este|norte|occidente|oeste|sur)?(\s)?(-)?(\s)?[0-9]{1,3}(\s)?(Este|Norte|Occidente|Oeste|Sur|este|norte|occidente|oeste|sur)?)?((\s)?(Agrupación|Altillo|Apartamento|Apartamento Sótano|Barrio|Bloque|Bodega|Cabecera Municipal|Callejón|Camino|Carretera|Casa|Caserio|Célula|Centro|Centro Comercial|Centro Urbano|Circular|Condominio|Conjunto|Consultorio|Corregimiento|Deposito|Deposito |Sótano|Edificio|Entrada|Esquina|Etapa|Finca|Garaje|Garaje Sótano|Grada|Inferior|Inspección de Policia|Interior|Kilometro|Local|Local Mezzanine|Local Sótano|Lote|Manzana|Manzanita|Mejora|Mezzanine|Módulo|Municipio|Núcleo|Oficina|Oficina Sótano|Parcela|Parcelación|Pasaje|Penthouse|Piso|Porteria|Predio|Principal|Puente|Quebrada|Salon|Sector|Semisótano|Suite|Supermanzana|Terraza|Torre|Troncal|Unidad|Urbanización|Vereda|Via|Zona|AGN|AL|APTO|AS|BR|BL|BG|CM|CLJ|CN|CT|CA|CAS|CEL|CE|CECO|CEUR|CIR|CDM|CONJ|CS|CO|DP|DS|ED|EN|ESQ|ET|FCA|GJ|GS|GR|INF|IP|IN|KM|LC|LM|LS|LT|MZ|MZTA|MJ|MN|MD|MUN|NCO|OF|OS|PA|PCN|PSJ|PH|PI|PT|PD|PPAL|PN|QDA|SA|SEC|SS|SU|SMZ|TZ|TO|TRL|UN|URB|VDA|VIA|ZN)?(\s)?[1-9][0-9]{0,3})*$';

    final RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return false;
    }
    return true;
  }

  bool isTextValid(String? value) {
    if (value == null) return false;
    if (value.length < 2) return false;
    const String pattern = r'^[a-zA-ZáÁéÉíÍóÓúÚüÜñÑ\s]+$';

    final RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return false;
    }
    return true;
  }

  bool isDateValid(String? value) {
    if (value == null) return false;
    if (value.length < 5) return false;
    const String pattern = r'^[0-9/]+$';

    final RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
