// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class RecipeData {
  RecipeData({
    this.keywords,
    this.promotion,
    this.servingsNounPlural,
    this.tipsAndRatingsEnabled,
    this.credits,
    this.videoAdContent,
    this.cookTimeMinutes,
    this.isOneTop,
    this.prepTimeMinutes,
    this.videoUrl,
    this.canonicalId,
    this.inspiredByUrl,
    this.numServings,
    this.totalTimeMinutes,
    this.updatedAt,
    this.yields,
    this.nutritionVisibility,
    this.brand,
    this.tags,
    this.name,
    this.showId,
    this.description,
    this.language,
    this.servingsNounSingular,
    this.sections,
    this.nutrition,
    this.aspectRatio,
    this.beautyUrl,
    this.thumbnailUrl,
    this.compilations,
    this.userRatings,
    this.approvedAt,
    this.isShoppable,
    this.show,
    this.renditions,
    this.buzzId,
    this.totalTimeTier,
    this.slug,
    this.instructions,
    this.originalVideoUrl,
    this.draftStatus,
    this.id,
    this.createdAt,
    this.seoTitle,
    this.videoId,
    this.facebookPosts,
    this.brandId,
    this.country,
  });

  final String keywords;
  final String promotion;
  final String servingsNounPlural;
  final bool tipsAndRatingsEnabled;
  final List<Credit> credits;
  final dynamic videoAdContent;
  final dynamic cookTimeMinutes;
  final bool isOneTop;
  final dynamic prepTimeMinutes;
  final dynamic videoUrl;
  final String canonicalId;
  final dynamic inspiredByUrl;
  final int numServings;
  final dynamic totalTimeMinutes;
  final int updatedAt;
  final String yields;
  final String nutritionVisibility;
  final dynamic brand;
  final List<Tag> tags;
  final String name;
  final int showId;
  final String description;
  final String language;
  final String servingsNounSingular;
  final List<Section> sections;
  final Nutrition nutrition;
  final String aspectRatio;
  final dynamic beautyUrl;
  final String thumbnailUrl;
  final List<dynamic> compilations;
  final UserRatings userRatings;
  final int approvedAt;
  final bool isShoppable;
  final Show show;
  final List<dynamic> renditions;
  final dynamic buzzId;
  final TotalTimeTier totalTimeTier;
  final String slug;
  final List<Instruction> instructions;
  final dynamic originalVideoUrl;
  final String draftStatus;
  final int id;
  final int createdAt;
  final String seoTitle;
  final dynamic videoId;
  final List<dynamic> facebookPosts;
  final dynamic brandId;
  final String country;

  RecipeData copyWith({
    String keywords,
    String promotion,
    String servingsNounPlural,
    bool tipsAndRatingsEnabled,
    List<Credit> credits,
    dynamic videoAdContent,
    dynamic cookTimeMinutes,
    bool isOneTop,
    dynamic prepTimeMinutes,
    dynamic videoUrl,
    String canonicalId,
    dynamic inspiredByUrl,
    int numServings,
    dynamic totalTimeMinutes,
    int updatedAt,
    String yields,
    String nutritionVisibility,
    dynamic brand,
    List<Tag> tags,
    String name,
    int showId,
    String description,
    String language,
    String servingsNounSingular,
    List<Section> sections,
    Nutrition nutrition,
    String aspectRatio,
    dynamic beautyUrl,
    String thumbnailUrl,
    List<dynamic> compilations,
    UserRatings userRatings,
    int approvedAt,
    bool isShoppable,
    Show show,
    List<dynamic> renditions,
    dynamic buzzId,
    TotalTimeTier totalTimeTier,
    String slug,
    List<Instruction> instructions,
    dynamic originalVideoUrl,
    String draftStatus,
    int id,
    int createdAt,
    String seoTitle,
    dynamic videoId,
    List<dynamic> facebookPosts,
    dynamic brandId,
    String country,
  }) =>
      RecipeData(
        keywords: keywords ?? this.keywords,
        promotion: promotion ?? this.promotion,
        servingsNounPlural: servingsNounPlural ?? this.servingsNounPlural,
        tipsAndRatingsEnabled:
            tipsAndRatingsEnabled ?? this.tipsAndRatingsEnabled,
        credits: credits ?? this.credits,
        videoAdContent: videoAdContent ?? this.videoAdContent,
        cookTimeMinutes: cookTimeMinutes ?? this.cookTimeMinutes,
        isOneTop: isOneTop ?? this.isOneTop,
        prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
        videoUrl: videoUrl ?? this.videoUrl,
        canonicalId: canonicalId ?? this.canonicalId,
        inspiredByUrl: inspiredByUrl ?? this.inspiredByUrl,
        numServings: numServings ?? this.numServings,
        totalTimeMinutes: totalTimeMinutes ?? this.totalTimeMinutes,
        updatedAt: updatedAt ?? this.updatedAt,
        yields: yields ?? this.yields,
        nutritionVisibility: nutritionVisibility ?? this.nutritionVisibility,
        brand: brand ?? this.brand,
        tags: tags ?? this.tags,
        name: name ?? this.name,
        showId: showId ?? this.showId,
        description: description ?? this.description,
        language: language ?? this.language,
        servingsNounSingular: servingsNounSingular ?? this.servingsNounSingular,
        sections: sections ?? this.sections,
        nutrition: nutrition ?? this.nutrition,
        aspectRatio: aspectRatio ?? this.aspectRatio,
        beautyUrl: beautyUrl ?? this.beautyUrl,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        compilations: compilations ?? this.compilations,
        userRatings: userRatings ?? this.userRatings,
        approvedAt: approvedAt ?? this.approvedAt,
        isShoppable: isShoppable ?? this.isShoppable,
        show: show ?? this.show,
        renditions: renditions ?? this.renditions,
        buzzId: buzzId ?? this.buzzId,
        totalTimeTier: totalTimeTier ?? this.totalTimeTier,
        slug: slug ?? this.slug,
        instructions: instructions ?? this.instructions,
        originalVideoUrl: originalVideoUrl ?? this.originalVideoUrl,
        draftStatus: draftStatus ?? this.draftStatus,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        seoTitle: seoTitle ?? this.seoTitle,
        videoId: videoId ?? this.videoId,
        facebookPosts: facebookPosts ?? this.facebookPosts,
        brandId: brandId ?? this.brandId,
        country: country ?? this.country,
      );

  factory RecipeData.fromJson(String str) =>
      RecipeData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecipeData.fromMap(Map<String, dynamic> json) => RecipeData(
        keywords: json["keywords"],
        promotion: json["promotion"],
        servingsNounPlural: json["servings_noun_plural"],
        tipsAndRatingsEnabled: json["tips_and_ratings_enabled"],
        credits:
            List<Credit>.from(json["credits"].map((x) => Credit.fromMap(x))),
        videoAdContent: json["video_ad_content"],
        cookTimeMinutes: json["cook_time_minutes"],
        isOneTop: json["is_one_top"],
        prepTimeMinutes: json["prep_time_minutes"],
        videoUrl: json["video_url"],
        canonicalId: json["canonical_id"],
        inspiredByUrl: json["inspired_by_url"],
        numServings: json["num_servings"],
        totalTimeMinutes: json["total_time_minutes"],
        updatedAt: json["updated_at"],
        yields: json["yields"],
        nutritionVisibility: json["nutrition_visibility"],
        brand: json["brand"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromMap(x))),
        name: json["name"],
        showId: json["show_id"],
        description: json["description"],
        language: json["language"],
        servingsNounSingular: json["servings_noun_singular"],
        sections:
            List<Section>.from(json["sections"].map((x) => Section.fromMap(x))),
        nutrition: Nutrition.fromMap(json["nutrition"]),
        aspectRatio: json["aspect_ratio"],
        beautyUrl: json["beauty_url"],
        thumbnailUrl: json["thumbnail_url"],
        compilations: List<dynamic>.from(json["compilations"].map((x) => x)),
        userRatings: UserRatings.fromMap(json["user_ratings"]),
        approvedAt: json["approved_at"],
        isShoppable: json["is_shoppable"],
        show: Show.fromMap(json["show"]),
        renditions: List<dynamic>.from(json["renditions"].map((x) => x)),
        buzzId: json["buzz_id"],
        totalTimeTier: TotalTimeTier.fromMap(json["total_time_tier"]),
        slug: json["slug"],
        instructions: List<Instruction>.from(
            json["instructions"].map((x) => Instruction.fromMap(x))),
        originalVideoUrl: json["original_video_url"],
        draftStatus: json["draft_status"],
        id: json["id"],
        createdAt: json["created_at"],
        seoTitle: json["seo_title"],
        videoId: json["video_id"],
        facebookPosts: List<dynamic>.from(json["facebook_posts"].map((x) => x)),
        brandId: json["brand_id"],
        country: json["country"],
      );

  Map<String, dynamic> toMap() => {
        "keywords": keywords,
        "promotion": promotion,
        "servings_noun_plural": servingsNounPlural,
        "tips_and_ratings_enabled": tipsAndRatingsEnabled,
        "credits": List<dynamic>.from(credits.map((x) => x.toMap())),
        "video_ad_content": videoAdContent,
        "cook_time_minutes": cookTimeMinutes,
        "is_one_top": isOneTop,
        "prep_time_minutes": prepTimeMinutes,
        "video_url": videoUrl,
        "canonical_id": canonicalId,
        "inspired_by_url": inspiredByUrl,
        "num_servings": numServings,
        "total_time_minutes": totalTimeMinutes,
        "updated_at": updatedAt,
        "yields": yields,
        "nutrition_visibility": nutritionVisibility,
        "brand": brand,
        "tags": List<dynamic>.from(tags.map((x) => x.toMap())),
        "name": name,
        "show_id": showId,
        "description": description,
        "language": language,
        "servings_noun_singular": servingsNounSingular,
        "sections": List<dynamic>.from(sections.map((x) => x.toMap())),
        "nutrition": nutrition.toMap(),
        "aspect_ratio": aspectRatio,
        "beauty_url": beautyUrl,
        "thumbnail_url": thumbnailUrl,
        "compilations": List<dynamic>.from(compilations.map((x) => x)),
        "user_ratings": userRatings.toMap(),
        "approved_at": approvedAt,
        "is_shoppable": isShoppable,
        "show": show.toMap(),
        "renditions": List<dynamic>.from(renditions.map((x) => x)),
        "buzz_id": buzzId,
        "total_time_tier": totalTimeTier.toMap(),
        "slug": slug,
        "instructions": List<dynamic>.from(instructions.map((x) => x.toMap())),
        "original_video_url": originalVideoUrl,
        "draft_status": draftStatus,
        "id": id,
        "created_at": createdAt,
        "seo_title": seoTitle,
        "video_id": videoId,
        "facebook_posts": List<dynamic>.from(facebookPosts.map((x) => x)),
        "brand_id": brandId,
        "country": country,
      };
}

class Credit {
  Credit({
    this.name,
    this.type,
  });

  final String name;
  final String type;

  Credit copyWith({
    String name,
    String type,
  }) =>
      Credit(
        name: name ?? this.name,
        type: type ?? this.type,
      );

  factory Credit.fromJson(String str) => Credit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Credit.fromMap(Map<String, dynamic> json) => Credit(
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "type": type,
      };
}

class Instruction {
  Instruction({
    this.id,
    this.displayText,
    this.position,
    this.startTime,
    this.endTime,
    this.temperature,
    this.appliance,
  });

  final int id;
  final String displayText;
  final int position;
  final int startTime;
  final int endTime;
  final dynamic temperature;
  final dynamic appliance;

  Instruction copyWith({
    int id,
    String displayText,
    int position,
    int startTime,
    int endTime,
    dynamic temperature,
    dynamic appliance,
  }) =>
      Instruction(
        id: id ?? this.id,
        displayText: displayText ?? this.displayText,
        position: position ?? this.position,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        temperature: temperature ?? this.temperature,
        appliance: appliance ?? this.appliance,
      );

  factory Instruction.fromJson(String str) =>
      Instruction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Instruction.fromMap(Map<String, dynamic> json) => Instruction(
        id: json["id"],
        displayText: json["display_text"],
        position: json["position"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        temperature: json["temperature"],
        appliance: json["appliance"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "display_text": displayText,
        "position": position,
        "start_time": startTime,
        "end_time": endTime,
        "temperature": temperature,
        "appliance": appliance,
      };
}

class Nutrition {
  Nutrition({
    this.carbohydrates,
    this.fiber,
    this.updatedAt,
    this.protein,
    this.fat,
    this.calories,
    this.sugar,
  });

  final int carbohydrates;
  final int fiber;
  final DateTime updatedAt;
  final int protein;
  final int fat;
  final int calories;
  final int sugar;

  Nutrition copyWith({
    int carbohydrates,
    int fiber,
    DateTime updatedAt,
    int protein,
    int fat,
    int calories,
    int sugar,
  }) =>
      Nutrition(
        carbohydrates: carbohydrates ?? this.carbohydrates,
        fiber: fiber ?? this.fiber,
        updatedAt: updatedAt ?? this.updatedAt,
        protein: protein ?? this.protein,
        fat: fat ?? this.fat,
        calories: calories ?? this.calories,
        sugar: sugar ?? this.sugar,
      );

  factory Nutrition.fromJson(String str) => Nutrition.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nutrition.fromMap(Map<String, dynamic> json) => Nutrition(
        carbohydrates: json["carbohydrates"],
        fiber: json["fiber"],
        updatedAt: DateTime.parse(json["updated_at"]),
        protein: json["protein"],
        fat: json["fat"],
        calories: json["calories"],
        sugar: json["sugar"],
      );

  Map<String, dynamic> toMap() => {
        "carbohydrates": carbohydrates,
        "fiber": fiber,
        "updated_at": updatedAt.toIso8601String(),
        "protein": protein,
        "fat": fat,
        "calories": calories,
        "sugar": sugar,
      };
}

class Section {
  Section({
    this.components,
    this.name,
    this.position,
  });

  final List<Component> components;
  final String name;
  final int position;

  Section copyWith({
    List<Component> components,
    String name,
    int position,
  }) =>
      Section(
        components: components ?? this.components,
        name: name ?? this.name,
        position: position ?? this.position,
      );

  factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Section.fromMap(Map<String, dynamic> json) => Section(
        components: List<Component>.from(
            json["components"].map((x) => Component.fromMap(x))),
        name: json["name"] == null ? null : json["name"],
        position: json["position"],
      );

  Map<String, dynamic> toMap() => {
        "components": List<dynamic>.from(components.map((x) => x.toMap())),
        "name": name == null ? null : name,
        "position": position,
      };
}

class Component {
  Component({
    this.id,
    this.rawText,
    this.extraComment,
    this.position,
    this.measurements,
    this.ingredient,
  });

  final int id;
  final String rawText;
  final String extraComment;
  final int position;
  final List<Measurement> measurements;
  final Ingredient ingredient;

  Component copyWith({
    int id,
    String rawText,
    String extraComment,
    int position,
    List<Measurement> measurements,
    Ingredient ingredient,
  }) =>
      Component(
        id: id ?? this.id,
        rawText: rawText ?? this.rawText,
        extraComment: extraComment ?? this.extraComment,
        position: position ?? this.position,
        measurements: measurements ?? this.measurements,
        ingredient: ingredient ?? this.ingredient,
      );

  factory Component.fromJson(String str) => Component.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Component.fromMap(Map<String, dynamic> json) => Component(
        id: json["id"],
        rawText: json["raw_text"],
        extraComment: json["extra_comment"],
        position: json["position"],
        measurements: List<Measurement>.from(
            json["measurements"].map((x) => Measurement.fromMap(x))),
        ingredient: Ingredient.fromMap(json["ingredient"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "raw_text": rawText,
        "extra_comment": extraComment,
        "position": position,
        "measurements": List<dynamic>.from(measurements.map((x) => x.toMap())),
        "ingredient": ingredient.toMap(),
      };
}

class Ingredient {
  Ingredient({
    this.displaySingular,
    this.displayPlural,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
  });

  final String displaySingular;
  final String displayPlural;
  final int createdAt;
  final int updatedAt;
  final int id;
  final String name;

  Ingredient copyWith({
    String displaySingular,
    String displayPlural,
    int createdAt,
    int updatedAt,
    int id,
    String name,
  }) =>
      Ingredient(
        displaySingular: displaySingular ?? this.displaySingular,
        displayPlural: displayPlural ?? this.displayPlural,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Ingredient.fromJson(String str) =>
      Ingredient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
        displaySingular: json["display_singular"],
        displayPlural: json["display_plural"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "display_singular": displaySingular,
        "display_plural": displayPlural,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "id": id,
        "name": name,
      };
}

class Measurement {
  Measurement({
    this.id,
    this.quantity,
    this.unit,
  });

  final int id;
  final String quantity;
  final Unit unit;

  Measurement copyWith({
    int id,
    String quantity,
    Unit unit,
  }) =>
      Measurement(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
      );

  factory Measurement.fromJson(String str) =>
      Measurement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Measurement.fromMap(Map<String, dynamic> json) => Measurement(
        id: json["id"],
        quantity: json["quantity"],
        unit: Unit.fromMap(json["unit"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "quantity": quantity,
        "unit": unit.toMap(),
      };
}

class Unit {
  Unit({
    this.name,
    this.abbreviation,
    this.displaySingular,
    this.displayPlural,
    this.system,
  });

  final String name;
  final String abbreviation;
  final String displaySingular;
  final String displayPlural;
  final System system;

  Unit copyWith({
    String name,
    String abbreviation,
    String displaySingular,
    String displayPlural,
    System system,
  }) =>
      Unit(
        name: name ?? this.name,
        abbreviation: abbreviation ?? this.abbreviation,
        displaySingular: displaySingular ?? this.displaySingular,
        displayPlural: displayPlural ?? this.displayPlural,
        system: system ?? this.system,
      );

  factory Unit.fromJson(String str) => Unit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Unit.fromMap(Map<String, dynamic> json) => Unit(
        name: json["name"],
        abbreviation: json["abbreviation"],
        displaySingular: json["display_singular"],
        displayPlural: json["display_plural"],
        system: systemValues.map[json["system"]],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "abbreviation": abbreviation,
        "display_singular": displaySingular,
        "display_plural": displayPlural,
        "system": systemValues.reverse[system],
      };
}

enum System { NONE, IMPERIAL, METRIC }

final systemValues = EnumValues({
  "imperial": System.IMPERIAL,
  "metric": System.METRIC,
  "none": System.NONE
});

class Show {
  Show({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  Show copyWith({
    int id,
    String name,
  }) =>
      Show(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Show.fromJson(String str) => Show.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Show.fromMap(Map<String, dynamic> json) => Show(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

class Tag {
  Tag({
    this.id,
    this.name,
    this.displayName,
    this.type,
  });

  final int id;
  final String name;
  final String displayName;
  final String type;

  Tag copyWith({
    int id,
    String name,
    String displayName,
    String type,
  }) =>
      Tag(
        id: id ?? this.id,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
        type: type ?? this.type,
      );

  factory Tag.fromJson(String str) => Tag.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        displayName: json["display_name"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "display_name": displayName,
        "type": type,
      };
}

class TotalTimeTier {
  TotalTimeTier({
    this.tier,
    this.displayTier,
  });

  final String tier;
  final String displayTier;

  TotalTimeTier copyWith({
    String tier,
    String displayTier,
  }) =>
      TotalTimeTier(
        tier: tier ?? this.tier,
        displayTier: displayTier ?? this.displayTier,
      );

  factory TotalTimeTier.fromJson(String str) =>
      TotalTimeTier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TotalTimeTier.fromMap(Map<String, dynamic> json) => TotalTimeTier(
        tier: json["tier"],
        displayTier: json["display_tier"],
      );

  Map<String, dynamic> toMap() => {
        "tier": tier,
        "display_tier": displayTier,
      };
}

class UserRatings {
  UserRatings({
    this.countPositive,
    this.countNegative,
    this.score,
  });

  final int countPositive;
  final int countNegative;
  final double score;

  UserRatings copyWith({
    int countPositive,
    int countNegative,
    double score,
  }) =>
      UserRatings(
        countPositive: countPositive ?? this.countPositive,
        countNegative: countNegative ?? this.countNegative,
        score: score ?? this.score,
      );

  factory UserRatings.fromJson(String str) =>
      UserRatings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserRatings.fromMap(Map<String, dynamic> json) => UserRatings(
        countPositive: json["count_positive"],
        countNegative: json["count_negative"],
        score: json["score"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "count_positive": countPositive,
        "count_negative": countNegative,
        "score": score,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
