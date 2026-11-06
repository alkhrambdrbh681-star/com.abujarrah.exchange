import 'package:flutter/material.dart';

void main() {
  runApp(const ExchangeApp());
}

class ExchangeApp extends StatelessWidget {
  const ExchangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF102A43);
    const teal = Color(0xFF16A394);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'صَرّاف',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: teal,
          primary: teal,
          surface: const Color(0xFFF5F8FA),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F8FA),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F8FA),
          foregroundColor: navy,
          centerTitle: false,
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: ExchangeHomePage(),
      ),
    );
  }
}

class Currency {
  const Currency(this.code, this.name, this.symbol, this.perUsd);

  final String code;
  final String name;
  final String symbol;

  /// Demo rate: units of this currency per 1 US dollar.
  final double perUsd;
}

const currencies = <Currency>[
  Currency('USD', 'دولار أمريكي', r'$', 1),
  Currency('EUR', 'يورو', '€', 0.92),
  Currency('SAR', 'ريال سعودي', 'ر.س', 3.75),
  Currency('AED', 'درهم إماراتي', 'د.إ', 3.67),
  Currency('JOD', 'دينار أردني', 'د.أ', 0.709),
  Currency('EGP', 'جنيه مصري', 'ج.م', 30.9),
];

class ExchangeHomePage extends StatefulWidget {
  const ExchangeHomePage({super.key});

  @override
  State<ExchangeHomePage> createState() => _ExchangeHomePageState();
}

class _ExchangeHomePageState extends State<ExchangeHomePage> {
  final _amountController = TextEditingController(text: '1');
  Currency _from = currencies[0];
  Currency _to = currencies[2];

  double get _amount => double.tryParse(_amountController.text.trim()) ?? 0;
  double get _result => _amount / _from.perUsd * _to.perUsd;
  double get _rate => _to.perUsd / _from.perUsd;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _swapCurrencies() {
    setState(() {
      final previousFrom = _from;
      _from = _to;
      _to = previousFrom;
    });
  }

  String _format(double value) => value.toStringAsFixed(value.abs() >= 100 ? 2 : 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('صَرّاف', style: TextStyle(fontWeight: FontWeight.w800)),
            Text('تحويل العملات بسهولة', style: TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'معلومات عن الأسعار',
            onPressed: () => _showRateInfo(context),
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            const Text(
              'حوّل أموالك',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF102A43)),
            ),
            const SizedBox(height: 6),
            const Text('اختر العملات وأدخل المبلغ لمعرفة قيمته التقريبية.', style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 24),
            _buildConverterCard(),
            const SizedBox(height: 16),
            _buildRateCard(),
            const SizedBox(height: 24),
            const Text('عملات شائعة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...currencies.where((currency) => currency.code != _from.code).take(4).map(_buildQuickCurrency),
            const SizedBox(height: 20),
            const Center(
              child: Text('الأسعار المعروضة تجريبية وليست أسعارًا مباشرة.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black54)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConverterCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('المبلغ', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54)),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              onChanged: (_) => setState(() {}),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                hintText: 'أدخل المبلغ',
                filled: true,
                fillColor: const Color(0xFFF5F8FA),
                prefixIcon: const Icon(Icons.payments_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 18),
            _currencySelector(label: 'من', selected: _from, onChanged: (value) => setState(() => _from = value)),
            Center(
              child: IconButton.filledTonal(
                tooltip: 'تبديل العملات',
                onPressed: _swapCurrencies,
                icon: const Icon(Icons.swap_vert_rounded),
              ),
            ),
            _currencySelector(label: 'إلى', selected: _to, onChanged: (value) => setState(() => _to = value)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF7F5),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('المبلغ بعد التحويل', style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 6),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      '${_format(_result)} ${_to.code}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF087F73)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _currencySelector({required String label, required Currency selected, required ValueChanged<Currency> onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54)),
        const SizedBox(height: 6),
        DropdownButtonFormField<Currency>(
          value: selected,
          isExpanded: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F8FA),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
          items: currencies.map((currency) => DropdownMenuItem(
            value: currency,
            child: Text('${currency.code} — ${currency.name}', overflow: TextOverflow.ellipsis),
          )).toList(),
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
        ),
      ],
    );
  }

  Widget _buildRateCard() {
    return Card(
      elevation: 0,
      color: const Color(0xFF102A43),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            const Icon(Icons.show_chart_rounded, color: Colors.white70),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '1 ${_from.code} = ${_format(_rate)} ${_to.code}',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickCurrency(Currency currency) {
    final converted = _amount / _from.perUsd * currency.perUsd;
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFEAF7F5),
          child: Text(currency.code.substring(0, 1), style: const TextStyle(color: Color(0xFF087F73), fontWeight: FontWeight.bold)),
        ),
        title: Text(currency.name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(currency.code, textDirection: TextDirection.ltr),
        trailing: Text('${_format(converted)} ${currency.code}', textDirection: TextDirection.ltr,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        onTap: () => setState(() => _to = currency),
      ),
    );
  }

  void _showRateInfo(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تنبيه'),
        content: const Text('هذا الإصدار يستخدم أسعارًا تجريبية ثابتة للتوضيح، ولا يتصل بمصدر أسعار مباشر. لا تعتمد عليه في المعاملات المالية.'),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('حسنًا'))],
      ),
    );
  }
}
