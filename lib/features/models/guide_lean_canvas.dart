import 'package:lean_canvas_project/core/constants/app_assets.dart';

class GuideLeanCanvas {
  final String? imagen;
  final String? imagePilar;
  final String? name;
  final String? description;
  final String? tips;

  GuideLeanCanvas({
    this.imagen,
    this.name,
    this.description,
    this.tips,
    this.imagePilar,
  });

  static List<GuideLeanCanvas> getGuideLeanCanvas = [
    // Problema
    GuideLeanCanvas(
      imagen: AppAssets.problema,
      name: 'Problema',
      description:
          'Identifica los principales problemas que enfrenta tu cliente.',
      tips: 'Tip: Enfócate en un problema clave que realmente puedas resolver.',
      imagePilar: AppAssets.problemaPilar,
    ),

    // Segmentos
    GuideLeanCanvas(
      imagen: AppAssets.segmentoCliente,
      name: 'Segmento de Clientes',
      description: 'Define quiénes son tus clientes específicos.',
      tips: 'Tip: Identifica el nicho de mercado al que te diriges.',
      imagePilar: AppAssets.segmentoClientePilar,
    ),

    // Propuesta de Valor
    GuideLeanCanvas(
      imagen: AppAssets.valorUnico,
      name: 'Propuesta de Valor Unica',
      description: 'Describe qué hace tu producto único y valioso.',
      tips: 'Tip: Enfócate en el beneficio principal que tu solución ofrece.',
      imagePilar: AppAssets.valorUnicoPilar,
    ),
    // Solucion
    GuideLeanCanvas(
      imagen: AppAssets.solucion,
      name: 'Solución',
      description:
          'Proporciona soluciones específicas a los problemas identificados.',
      tips: 'Tip: Cada problema debería tener una solución clara y directa.',
      imagePilar: AppAssets.solucionPilar,
    ),

    // Canales
    GuideLeanCanvas(
      imagen: AppAssets.canales,
      name: 'Canales',
      description: 'Indica cómo llegarás a tus clientes.',
      tips: 'Tip: Elige canales que tu segmento de clientes ya utilice.',
      imagePilar: AppAssets.canalesPilar,
    ),

    // Flujo de Ingresos
    GuideLeanCanvas(
      imagen: AppAssets.flujoIngreso,
      name: 'Flujo de Ingresos',
      description: 'Explica cómo generarás ingresos.',
      tips:
          'Tip: Considera modelos de ingresos recurrentes para mayor estabilidad.',
      imagePilar: AppAssets.flujoIngresoPilar,
    ),

    // Estructura de costos
    GuideLeanCanvas(
      imagen: AppAssets.estructuraCoste,
      name: 'Estructura de Costos',
      description: 'Detalla los costos principales de tu negocio.',
      tips: 'Tip: Asegúrate de incluir todos los costos operativos clave.',
      imagePilar: AppAssets.estructuraCostePilar,
    ),

    // Metricas Clave
    GuideLeanCanvas(
      imagen: AppAssets.metricasClave,
      name: 'Métricas Clave',
      description: 'Define las métricas para medir el éxito.',
      tips: 'Tip: Selecciona métricas que te permitan ajustar rápidamente.',
      imagePilar: AppAssets.metricasClavePilar,
    ),

    // Ventaja Competitiva
    GuideLeanCanvas(
      imagen: AppAssets.ventajas,
      name: 'Ventaja Competitiva',
      description: 'Describe lo que te hace difícil de imitar.',
      tips: 'Tip: Enfócate en construir barreras que protejan tu negocio.',
      imagePilar: AppAssets.ventajasPilar,
    ),
  ];
}
