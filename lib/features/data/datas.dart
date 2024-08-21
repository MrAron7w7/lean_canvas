import 'package:lean_canvas_project/core/constants/app_assets.dart';
import 'package:lean_canvas_project/features/models/guide_lean_canvas.dart';
import 'package:lean_canvas_project/features/models/presentation.dart';

// Datos de homeview para lo que es los pilares de lean canvas
final List<GuideLeanCanvas> getGuideLeanCanvas = [
  // Problema
  GuideLeanCanvas(
    imagen: AppAssets.problema,
    name: 'Problema',
    description:
        'Es fundamental identificar los problemas más importantes que enfrentan tus clientes potenciales. Estos problemas deben ser reales y urgentes, ya que tu propuesta de valor girará en torno a resolverlos de manera efectiva. Al comprender a fondo los desafíos de tus clientes, puedes diseñar una solución que realmente marque la diferencia en sus vidas o negocios.',
    tips: 'Enfócate en un problema clave que realmente puedas resolver.',
    imagePilar: AppAssets.problemaPilar,
  ),

  // Segmentos
  GuideLeanCanvas(
    imagen: AppAssets.segmentoCliente,
    name: 'Segmento de Clientes',
    description:
        'Definir quiénes son tus clientes específicos es crucial para el éxito de tu negocio. No todos los usuarios de un mercado amplio serán tus clientes; en cambio, debes centrarte en un nicho particular al que puedas atender de manera efectiva. Al entender bien a tus clientes, puedes adaptar tus mensajes de marketing y tu producto para satisfacer mejor sus necesidades.',
    tips: 'Identifica el nicho de mercado al que te diriges.',
    imagePilar: AppAssets.segmentoClientePilar,
  ),

  // Propuesta de Valor
  GuideLeanCanvas(
    imagen: AppAssets.valorUnico,
    name: 'Propuesta de Valor Unica',
    description:
        'La propuesta de valor es lo que hace que tu producto o servicio sea único y deseable para tus clientes. Es la promesa de valor que entregas y que hace que tus clientes elijan tu solución sobre otras en el mercado. Es fundamental articular claramente cómo tu producto resuelve un problema específico de una manera mejor o diferente que las alternativas disponibles.',
    tips: 'Enfócate en el beneficio principal que tu solución ofrece.',
    imagePilar: AppAssets.valorUnicoPilar,
  ),
  // Solucion
  GuideLeanCanvas(
    imagen: AppAssets.solucion,
    name: 'Solución',
    description:
        'Una vez identificados los problemas, debes proporcionar soluciones claras y específicas para cada uno. Tu solución debe ser lo suficientemente robusta para abordar los problemas de manera efectiva y lo suficientemente simple para que tus clientes puedan adoptarla sin complicaciones. Cada solución debe estar alineada con tu propuesta de valor.',
    tips: 'Cada problema debería tener una solución clara y directa.',
    imagePilar: AppAssets.solucionPilar,
  ),

  // Canales
  GuideLeanCanvas(
    imagen: AppAssets.canales,
    name: 'Canales',
    description:
        'Los canales son los medios a través de los cuales te conectarás con tus clientes para entregarles tu propuesta de valor. Esto puede incluir tanto canales de comunicación (como marketing digital, redes sociales, email marketing) como canales de distribución (como tiendas en línea o aplicaciones móviles). La elección de los canales adecuados es clave para maximizar la eficiencia en la adquisición de clientes.',
    tips: 'Elige canales que tu segmento de clientes ya utilice.',
    imagePilar: AppAssets.canalesPilar,
  ),

  // Flujo de Ingresos
  GuideLeanCanvas(
    imagen: AppAssets.flujoIngreso,
    name: 'Flujo de Ingresos',
    description:
        'El flujo de ingresos explica cómo tu negocio generará dinero a partir de las soluciones que ofrece. Puede haber múltiples fuentes de ingresos, desde ventas directas de productos hasta modelos de suscripción o publicidad. Es importante diseñar un flujo de ingresos que no solo sea sostenible, sino que también se alinee con las expectativas y comportamientos de tus clientes.',
    tips: 'Considera modelos de ingresos recurrentes para mayor estabilidad.',
    imagePilar: AppAssets.flujoIngresoPilar,
  ),

  // Estructura de costos
  GuideLeanCanvas(
    imagen: AppAssets.estructuraCoste,
    name: 'Estructura de Costos',
    description:
        'Detallar la estructura de costos es esencial para entender los gastos asociados a la operación de tu negocio. Esto incluye todos los costos fijos y variables, desde el desarrollo de productos hasta el marketing y la administración. Tener una comprensión clara de tus costos te ayudará a planificar tus finanzas y asegurar la rentabilidad a largo plazo.',
    tips: 'Asegúrate de incluir todos los costos operativos clave.',
    imagePilar: AppAssets.estructuraCostePilar,
  ),

  // Metricas Clave
  GuideLeanCanvas(
    imagen: AppAssets.metricasClave,
    name: 'Métricas Clave',
    description:
        'Las métricas clave son indicadores que te permiten medir el éxito de tu negocio. Estas métricas te ayudarán a entender cómo está funcionando tu producto y dónde necesitas hacer ajustes. Deben ser específicas, cuantificables y alineadas con tus objetivos de negocio. Elegir las métricas correctas te permitirá tomar decisiones informadas y rápidas para mejorar tu producto y crecimiento.',
    tips: 'Selecciona métricas que te permitan ajustar rápidamente.',
    imagePilar: AppAssets.metricasClavePilar,
  ),

  // Ventaja Competitiva
  GuideLeanCanvas(
    imagen: AppAssets.ventajas,
    name: 'Ventaja Competitiva',
    description:
        'La ventaja competitiva es lo que te hace único y difícil de imitar por la competencia. Esto puede estar relacionado con tecnología propietaria, acceso a recursos exclusivos, o un conocimiento profundo del mercado. Es lo que te dará una posición fuerte en el mercado y te permitirá proteger tu negocio frente a competidores. La construcción de una ventaja competitiva sólida es crucial para la sostenibilidad a largo plazo.',
    tips: 'Enfócate en construir barreras que protejan tu negocio.',
    imagePilar: AppAssets.ventajasPilar,
  ),
];

// Datos de presentaciones lean canvas
final List<Presentation> getPresentations = [
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
