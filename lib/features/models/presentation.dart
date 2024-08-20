class Presentation {
  String? title;
  String? description;
  String? image;

  Presentation({
    this.title,
    this.description,
    this.image,
  });

  static List<Presentation> getPresentations() {
    return [
      Presentation(
        title: 'Bienvenido y conoce a Lean Canvas',
        description:
            'Transforma tu idea en negocio sólido con nuestro enfoque estructurado y visual.',
        image: 'assets/welcome.jpg',
      ),
      Presentation(
        title: 'Descubre los Beneficios de Lean Canvas',
        description:
            'Simplifica la planificación y enfócate en lo que realmente importa para tu negocio.',
        image: 'assets/beneficios.jpg',
      ),
      Presentation(
        title: 'Empieza a Crear tu Lean Canvas',
        description:
            'Completa los 9 bloques  esenciales para darle vida a tu idea de negocio',
        image: 'assets/empieza.jpg',
      ),
    ];
  }
}
